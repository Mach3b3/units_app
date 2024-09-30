import 'package:flutter/material.dart';
import 'package:units_app/views/pages/search_page.dart';
import 'package:units_app/views/pages/units_reflection.dart';
import 'package:units_app/views/pages/welcome.dart';

class RouteManager {
  // Define static constants for the route names
  static const String welcome = '/';
  static const String unitsReflection = '/unitsReflection';
  static const String search = '/search';

  // Define a static method that generates the routes based on the settings
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        // Return a new MaterialPageRoute when the welcome route is accessed
        return MaterialPageRoute(
          builder: (context) => const Welcome(),
        );

      case unitsReflection:
        // Return a new MaterialPageRoute when the units reflection route is accessed
        return MaterialPageRoute(
          builder: (context) => const UnitsReflection(),
        );

      case search:
        // Return a new MaterialPageRoute when the search route is accessed
        return MaterialPageRoute(
          builder: (context) => const Search(),
        );

      default:
        // Throw a FormatException when the route is not found
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
