import 'package:flutter/material.dart';

import '../models/fire_detection_model.dart';


class FireOverlayCard extends StatelessWidget {


  final FireDetectionModel detection;


  const FireOverlayCard({

    super.key,

    required this.detection,

  });



  @override
  Widget build(BuildContext context) {


    return Card(


      color: Colors.red.shade900,


      child: Padding(


        padding:
        const EdgeInsets.all(16),



        child: Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,


          children: [


            const Text(

              "🔥 AI FIRE ANALYSIS",

              style: TextStyle(

                color: Colors.white,

                fontSize:18,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height:10),



            Text(

              "Fire Type: ${detection.fireType}",

              style:
              const TextStyle(

                color: Colors.white,

              ),

            ),



            Text(

              "Temperature: ${detection.temperature}°C",

              style:
              const TextStyle(

                color: Colors.white,

              ),

            ),



            Text(

              "Confidence: ${detection.confidence}%",

              style:
              const TextStyle(

                color: Colors.white,

              ),

            ),



            Text(

              "Severity: ${detection.severity}",

              style:
              const TextStyle(

                color: Colors.white,

              ),

            ),


          ],


        ),

      ),


    );


  }

}