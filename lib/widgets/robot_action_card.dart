import 'package:flutter/material.dart';

import '../models/robot_action_model.dart';



class RobotActionCard extends StatelessWidget {


  final RobotActionModel action;



  const RobotActionCard({

    super.key,

    required this.action,

  });





  @override
  Widget build(BuildContext context){



    return Card(


      color: Colors.blueGrey.shade900,



      child: Padding(


        padding:

        const EdgeInsets.all(16),



        child: Column(


          crossAxisAlignment:

          CrossAxisAlignment.start,



          children: [



            const Text(

              "🤖 ROBOT AUTONOMOUS ACTION",

              style:

              TextStyle(

                color: Colors.cyanAccent,

                fontSize:18,

                fontWeight: FontWeight.bold,

              ),

            ),




            const SizedBox(height:15),




            Text(

              "Movement: ${action.movement}",

              style:

              const TextStyle(

                color: Colors.white,

              ),

            ),





            Text(

              "Extinguisher: ${action.extinguisher}",

              style:

              const TextStyle(

                color: Colors.white,

              ),

            ),





            Text(

              "Robot Mode: ${action.robotMode}",

              style:

              const TextStyle(

                color: Colors.greenAccent,

              ),

            ),





            Text(

              "Safety: ${action.safetyStatus}",

              style:

              const TextStyle(

                color: Colors.orangeAccent,

              ),

            ),





            Text(

              "Message: ${action.message}",

              style:

              const TextStyle(

                color: Colors.white70,

              ),

            ),



          ],


        ),


      ),


    );


  }



}