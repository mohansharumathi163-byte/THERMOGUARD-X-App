import 'package:flutter/material.dart';

import '../models/fire_ai_model.dart';


class FireDecisionCard extends StatelessWidget {


  final FireAIModel decision;


  const FireDecisionCard({

    super.key,

    required this.decision,

  });



  @override
  Widget build(BuildContext context) {


    return Card(


      color: Colors.orange.shade900,


      child: Padding(


        padding:

        const EdgeInsets.all(16),



        child: Column(


          crossAxisAlignment:

          CrossAxisAlignment.start,



          children: [



            const Text(

              "🤖 AI FIRE DECISION",

              style: TextStyle(

                color: Colors.white,

                fontSize:18,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height:10),



            Text(

              "Detected Fire: ${decision.detectedFireType}",

              style:

              const TextStyle(

                color: Colors.white,

              ),

            ),



            Text(

              "Recommended Agent: ${decision.recommendedAgent}",

              style:

              const TextStyle(

                color: Colors.white,

              ),

            ),



            Text(

              "Confidence: ${decision.confidence}%",

              style:

              const TextStyle(

                color: Colors.white,

              ),

            ),



            Text(

              "Warning: ${decision.safetyWarning}",

              style:

              const TextStyle(

                color: Colors.white,

              ),

            ),



            Text(

              "Reason: ${decision.reason}",

              style:

              const TextStyle(

                color: Colors.white,

              ),

            ),



            Text(

              decision.aiStatus,

              style:

              const TextStyle(

                color: Colors.greenAccent,

                fontWeight: FontWeight.bold,

              ),

            ),


          ],


        ),


      ),


    );


  }


}