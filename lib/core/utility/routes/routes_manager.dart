import 'package:flutter/material.dart';

import '../../../presentation/views/Details/details.dart';
import '../../../presentation/views/Home/home.dart';
import '../../services/DataClass/countries_model.dart';

class RouteGenerator {
  // ignore: non_constant_identifier_names
  static Route<dynamic>? GenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/homePage":
        return MaterialPageRoute(builder: (_) {
          return HomePage();
        });
      case "/details":
        return MaterialPageRoute(builder: (_) {
          return DetailsPage(
            countriesList: args as CountriesList,
          );
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return Container(
            color: Colors.white,
            child: const Center(
                child: Text(
              "Error, Incorrect Route",
              textAlign: TextAlign.center,
            )),
          );
        });
    }
  }
}
