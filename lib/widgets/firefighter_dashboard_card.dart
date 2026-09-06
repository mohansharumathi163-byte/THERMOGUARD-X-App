import 'package:flutter/material.dart';

import '../models/fire_ai_model.dart';



class FirefighterDashboardCard extends StatelessWidget {


  final FireAIModel decision;



  const FirefighterDashboardCard({

    super.key,

    required this.decision,

  });




  @override
  Widget build(BuildContext context) {


    return Card(


      color: Colors.black87,


      child: Padding(


        padding:
        const EdgeInsets.all(16),



        child: Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,



          children: [



            const Text(


              "🚒 FIREFIGHTER DECISION DASHBOARD",


              style: TextStyle(


                color: Colors.orange,


                fontSize:18,


                fontWeight: FontWeight.bold,


              ),


            ),




            const SizedBox(height:15),




            Text(

              "🔥 Fire Type: ${decision.detectedFireType}",

              style:

              const TextStyle(

                color: Colors.white,

              ),

            ),





            Text(

              "🧯 Recommended Agent: ${decision.recommendedAgent}",

              style:

              const TextStyle(

                color: Colors.white,

              ),

            ),





            Text(

              "⚠ Warning: ${decision.safetyWarning}",

              style:

              const TextStyle(

                color: Colors.redAccent,

              ),

            ),





            Text(

              "🤖 AI Status: ${decision.aiStatus}",

              style:

              const TextStyle(

                color: Colors.greenAccent,

              ),

            ),





            Text(

              "Reason: ${decision.reason}",

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