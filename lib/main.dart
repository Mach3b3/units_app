import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:units_app/models/units_data.dart';
import 'package:units_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a ChangeNotifierProvider with UnitsData as the value
    return ChangeNotifierProvider(
      create: (context) => UnitsData(),
      // Build the MaterialApp widget with the ChangeNotifierProvider as a parent
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Set the theme of the app to dark mode with primary color as cyan
          theme: ThemeData(
            brightness: Brightness.dark,
            // primarySwatch: Colors.cyan,
          ),
          // Set the initial route to the welcome page and the route generator to RouteManager.generateRoute
          initialRoute: RouteManager.welcome,
          onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );
  }
}
