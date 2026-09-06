import 'package:flutter/material.dart';


class AppTheme {


  static ThemeData darkTheme = ThemeData(


    brightness: Brightness.dark,


    scaffoldBackgroundColor: const Color(0xFF0B0F14),



    primaryColor: Colors.red.shade900,



    appBarTheme: AppBarTheme(


      backgroundColor: Colors.red.shade900,


      foregroundColor: Colors.white,


      elevation: 4,


      titleTextStyle: const TextStyle(


        color: Colors.white,


        fontSize: 20,


        fontWeight: FontWeight.bold,


      ),


    ),





    cardTheme: CardThemeData(


      color: const Color(0xFF151A21),


      elevation: 8,


      shape: RoundedRectangleBorder(


        borderRadius: BorderRadius.circular(16),


      ),


    ),





    elevatedButtonTheme: ElevatedButtonThemeData(


      style: ElevatedButton.styleFrom(


        backgroundColor: Colors.red.shade900,


        foregroundColor: Colors.white,


        padding: const EdgeInsets.symmetric(


          vertical: 15,


          horizontal: 20,


        ),


        shape: RoundedRectangleBorder(


          borderRadius: BorderRadius.circular(12),


        ),


      ),


    ),





    textTheme: const TextTheme(


      headlineSmall: TextStyle(


        color: Colors.white,


        fontSize: 24,


        fontWeight: FontWeight.bold,


      ),



      titleLarge: TextStyle(


        color: Colors.white,


        fontSize: 18,


        fontWeight: FontWeight.bold,


      ),



      bodyMedium: TextStyle(


        color: Colors.white70,


        fontSize: 15,


      ),


    ),



    iconTheme: const IconThemeData(


      color: Colors.white,


    ),


  );

}