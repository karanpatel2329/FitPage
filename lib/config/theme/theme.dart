
import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  brightness: Brightness.light,
  listTileTheme: ListTileThemeData(
            textColor: Colors.white,
          ),
           textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.white), // Set the default text color to white
          bodyMedium: TextStyle(color: Colors.white), // You can customize other text styles as needed
        ),
        scaffoldBackgroundColor: Colors.black, // Set the default background color to black
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // Set the app bar background color to black
        ),
);
