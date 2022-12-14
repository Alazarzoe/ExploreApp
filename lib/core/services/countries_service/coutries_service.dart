import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:world/core/extensions/extensions.dart';

import '../DataClass/countries_model.dart';
import '../connectivity/connectivity_retrier.dart';
import '../connectivity/interceptor.dart';

class CountriesService {
  CountriesService() {
    initializeNewInterceptors();
  }
  Response<String>? response;
  final _dio = Dio(
    BaseOptions(
      headers: {"Accept": "application/json"},
      baseUrl: "https://restcountries.com/v3.1",
      // connectTimeout: 15000,
      // receiveTimeout: 15000,
    ),
  );

  Future<List<CountriesList>> getCountries() async {
    response = await _dio.get('/all',
        options: Options(responseType: ResponseType.json));

    final countriesList = countriesListFromJson(response!.data.toString());
    var status = _dio.options.validateStatus;
    debugPrint("$status");
    return countriesList;
  }

  Future<List<String>> getTimeZone(List<CountriesList> countriesList) async {
    var list = <String>[];
    for (var i = 0; i < countriesList.length; i++) {
      var country = countriesList[i];
      if (country.timezones != null) {
        var timeZone = country.timezones!;

        list.addAllUnique(timeZone);
      }
    }
    list.sort((a, b) => a.compareTo(b));

    return list;
  }

  Future<List<String>> getRegion(List<CountriesList> countriesList) async {
    var list = <String>[];
    for (var i = 0; i < countriesList.length; i++) {
      var country = countriesList[i];
      if (country.region != null && !(list.contains(country.region))) {
        list.add(country.region!);
      }
    }
    list.sort((a, b) => a.compareTo(b));

    return list;
  }

  Future<List<String>> getLanguages(List<CountriesList> countriesList) async {
    var list = <String>[];
    for (var i = 0; i < countriesList.length; i++) {
      var country = countriesList[i];
      if (country.languages != null) {
        List<String?> nonNullLanguageList = country.languages!
            .getLanguages()
            .where((element) => element != null)
            .toList();

        list.addAllUnique(nonNullLanguageList);
      }
    }
    list.sort((a, b) => a.compareTo(b));

    return list;
  }

  Future<List<String>> getTranslations(
      List<CountriesList> countriesList) async {
    var list = <String>[];
    for (var i = 0; i < countriesList.length; i++) {
      var country = countriesList[i];
      if (country.translations != null) {
        list.addAllUnique(country.translations!.keys.toList());
      }
    }
    list.sort((a, b) => a.compareTo(b));

    return list;
  }

  void initializeNewInterceptors() {
    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: _dio,
          connectivity: Connectivity(),
        ),
      ),
    );
  }

  void initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(onError: (e, handler) {
        switch (e.type) {
          case DioErrorType.receiveTimeout:
            print("The error is Receieve Timeout. Message is ${e.message}");
            break;
          case DioErrorType.connectTimeout:
            print("The error is connectTimeout. Message is ${e.message}");
            break;
          case DioErrorType.response:
            print("The error is response. Message is ${e.message}");
            break;
          case DioErrorType.cancel:
            print("The error is cancel. Message is ${e.message}");
            break;
          case DioErrorType.sendTimeout:
            print("The error is send. Message is ${e.message}");
            break;
          case DioErrorType.other:
            if (e.message.contains("SocketException")) {
              // throw SocketException(e.message);
            }
            print("The error is other. Message is ${e.message}");
            print("Socket Exception");
            print("${e.error}");
            print("${e.type}");
            // handler.reject(e);

            if (e.error == SocketException(e.message)) {}
            break;
          default:
        }

        // return handler.next(e);
      }, onRequest: (request, handler) {
        return handler.next(request);
      }, onResponse: (response, handler) {
        var status = response.statusCode;
        print("$status");
        return handler.next(response);
      }),
    );
  }
}
