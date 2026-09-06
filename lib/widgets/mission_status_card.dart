import 'package:flutter/material.dart';

import '../models/mission_model.dart';


class MissionStatusCard extends StatelessWidget {


  final MissionModel mission;


  const MissionStatusCard({

    super.key,

    required this.mission,

  });



  @override
  Widget build(BuildContext context){


    return Card(

      color: Colors.grey.shade900,


      child: Padding(

        padding:
        const EdgeInsets.all(16),


        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children:[


            const Text(

              "🚨 CURRENT RESCUE MISSION",

              style: TextStyle(

                color: Colors.orange,

                fontSize:18,

                fontWeight: FontWeight.bold,

              ),

            ),


            const SizedBox(height:15),


            Text(
              "Mission ID : ${mission.missionId}",
              style:
              const TextStyle(color:Colors.white),
            ),


            Text(
              "Status : ${mission.missionStatus}",
              style:
              const TextStyle(color:Colors.green),
            ),


            Text(
              "Robot : ${mission.robotStatus}",
              style:
              const TextStyle(color:Colors.white),
            ),


            Text(
              "Battery : ${mission.battery}%",
              style:
              const TextStyle(color:Colors.white),
            ),


            Text(
              "Location : ${mission.robotLocation}",
              style:
              const TextStyle(color:Colors.white),
            ),


            Text(
              "Target : ${mission.targetLocation}",
              style:
              const TextStyle(color:Colors.white),
            ),


            Text(
              "Fire : ${mission.fireStatus}",
              style:
              const TextStyle(color:Colors.redAccent),
            ),


            Text(
              "Survivor : ${mission.survivorStatus}",
              style:
              const TextStyle(color:Colors.white),
            ),



          ],


        ),


      ),


    );


  }


}