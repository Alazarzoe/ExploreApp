import 'dart:convert';

import 'package:http/http.dart' as http;

const urlall = 'https://restcountries.com/v3.1/all';
const urlFlag = 'https://restcountries.eu/data/';

class NetWork {
  Future getAllCountries() async {
    try {
      final uri = Uri.parse(urlall);
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var jasonData = jsonDecode(response.body);
        List<dynamic> countriesName = [];
        for (var country in jasonData) {
          countriesName.add(country['name']);
        }
        return countriesName;
      }
    } catch (e) {
      print('e => $e');
    }
  }

  Future getAllCountriesFlag() async {
    try {
      final uri = Uri.parse(urlFlag);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var jasonData = jsonDecode(response.body);
        List<dynamic> countriesFlag = [];
        for (var flag in jasonData) {
          countriesFlag.add(flag['flag']);
        }
        return countriesFlag;
      }
    } catch (e) {
      print('e => $e');
    }
  }
}
