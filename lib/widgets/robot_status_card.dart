import 'package:flutter/material.dart';

import '../models/robot_status_model.dart';



class RobotStatusCard extends StatelessWidget {


  final RobotStatusModel status;



  const RobotStatusCard({

    super.key,

    required this.status,

  });



  @override
  Widget build(BuildContext context) {


    return Card(

      child: Column(

        children: [


          ListTile(

            leading: const Icon(

              Icons.battery_full,

              color: Colors.green,

            ),

            title: const Text(
              "Battery",
            ),

            subtitle: Text(
              "${status.battery}%",
            ),

          ),



          ListTile(

            leading: const Icon(
              Icons.thermostat,
              color: Colors.orange,
            ),

            title: const Text(
              "Temperature",
            ),

            subtitle: Text(
              "${status.temperature} °C",
            ),

          ),



          ListTile(

            leading: const Icon(
              Icons.wifi,
              color: Colors.blue,
            ),

            title: const Text(
              "Signal",
            ),

            subtitle: Text(
              status.signalStrength,
            ),

          ),


        ],


      ),


    );


  }


}