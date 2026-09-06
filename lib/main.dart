import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'screens/dashboard_screen.dart';



void main() {

  runApp(const ThermoGuardApp());

}



class ThermoGuardApp extends StatelessWidget {

  const ThermoGuardApp({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    return MaterialApp(


      debugShowCheckedModeBanner: false,


      title: 'THERMOGUARD-X',



      // Professional Rescue Operator Theme

      theme: AppTheme.darkTheme,



      home: const DashboardScreen(),


    );


  }

}