import 'package:flutter/material.dart';

import '../models/firefighter_action_model.dart';


class FirefighterActionCard extends StatelessWidget {


  final FirefighterActionModel action;


  const FirefighterActionCard({

    super.key,

    required this.action,

  });



  @override
  Widget build(BuildContext context) {


    return Card(

      color: Colors.red.shade900,


      elevation: 8,


      child: Padding(


        padding:
        const EdgeInsets.all(16),


        child: Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,


          children: [



            const Text(

              "🔥 FIREFIGHTER RESPONSE",

              style:

              TextStyle(

                color: Colors.white,

                fontSize: 20,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height:15),




            buildRow(
              "Emergency Level",
              action.emergencyLevel,
            ),



            buildRow(
              "Robot Mode",
              action.robotMode,
            ),



            buildRow(
              "Action",
              action.recommendedAction,
            ),



            buildRow(
              "Priority",
              action.priority,
            ),



            buildRow(
              "Safety",
              action.safetyDistance,
            ),



          ],


        ),


      ),


    );


  }






  Widget buildRow(
      String title,
      String value
      ){


    return Padding(

      padding:
      const EdgeInsets.symmetric(
          vertical:5
      ),


      child: Row(


        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [


          Text(

            "$title : ",

            style:

            const TextStyle(

              color: Colors.white70,

              fontWeight: FontWeight.bold,

            ),

          ),



          Expanded(

            child:

            Text(

              value,

              style:

              const TextStyle(

                color: Colors.white,

              ),

            ),

          ),



        ],


      ),


    );


  }



}