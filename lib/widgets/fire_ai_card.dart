import 'package:flutter/material.dart';

import '../models/fire_ai_model.dart';



class FireAICard extends StatelessWidget {


  final FireAIModel fireAI;



  const FireAICard({

    super.key,

    required this.fireAI,

  });





  @override
  Widget build(BuildContext context) {



    return Card(


      color: Colors.grey.shade900,



      child: Padding(


        padding:
        const EdgeInsets.all(16),



        child: Column(



          crossAxisAlignment:
          CrossAxisAlignment.start,



          children: [





            Row(



              children: [



                const Icon(


                  Icons.psychology,


                  color: Colors.cyan,


                  size:32,


                ),




                const SizedBox(width:10),





                Text(


                  "AI FIRE ANALYSIS",


                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(


                    color: Colors.white,


                    fontWeight:
                    FontWeight.bold,


                  ),


                ),



              ],


            ),






            const SizedBox(height:20),






            _infoRow(

              "AI Status",

              fireAI.aiStatus,

              Colors.green,

            ),






            _infoRow(

              "Detected Fire",

              fireAI.detectedFireType,

              Colors.red,

            ),





            _infoRow(

              "Recommended Agent",

              fireAI.recommendedAgent,

              Colors.orange,

            ),





            _infoRow(

              "Confidence",

              "${fireAI.confidence}%",

              Colors.cyan,

            ),





            _infoRow(

              "Safety Warning",

              fireAI.safetyWarning,

              Colors.yellow,

            ),





            _infoRow(

              "Reason",

              fireAI.reason,

              Colors.white,

            ),





          ],


        ),


      ),


    );


  }








  Widget _infoRow(



      String title,

      String value,

      Color color,

      ){



    return Padding(


      padding:
      const EdgeInsets.symmetric(

        vertical:8,

      ),




      child: Row(



        crossAxisAlignment:
        CrossAxisAlignment.start,



        children: [





          Expanded(



            child: Text(


              title,


              style: const TextStyle(


                color: Colors.white70,


              ),


            ),



          ),






          Expanded(



            child: Text(


              value,


              textAlign:
              TextAlign.right,



              style: TextStyle(


                color: color,


                fontWeight:
                FontWeight.bold,


              ),



            ),



          ),




        ],


      ),


    );


  }



}