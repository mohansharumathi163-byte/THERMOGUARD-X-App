import 'package:flutter/material.dart';



class SurvivorAICard extends StatelessWidget {


  final String detectionStatus;

  final String confidence;

  final String detectionSource;

  final String detectionTime;



  const SurvivorAICard({


    super.key,


    required this.detectionStatus,


    required this.confidence,


    required this.detectionSource,


    required this.detectionTime,


  });



  @override
  Widget build(BuildContext context) {


    return Card(


      child: Padding(


        padding: const EdgeInsets.all(16),



        child: Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,



          children: [



            Row(


              children: [


                const Icon(

                  Icons.psychology,

                  color: Colors.red,

                  size:30,

                ),




                const SizedBox(width:10),




                Text(


                  "AI SURVIVOR DETECTION",


                  style: Theme.of(context)
                      .textTheme
                      .titleLarge,


                ),


              ],


            ),




            const SizedBox(height:15),





            _infoRow(

              "Detection Status",

              detectionStatus,

              Colors.green,

            ),





            _infoRow(

              "AI Confidence",

              confidence,

              Colors.blue,

            ),





            _infoRow(

              "Detection Source",

              detectionSource,

              Colors.orange,

            ),





            _infoRow(

              "Detection Time",

              detectionTime,

              Colors.grey,

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

      ) {


    return Padding(


      padding:
      const EdgeInsets.symmetric(

        vertical:8,

      ),



      child: Row(


        children: [



          Expanded(


            child: Text(

              title,

            ),

          ),





          Text(


            value,


            style: TextStyle(

              color: color,

              fontWeight:
              FontWeight.bold,

            ),


          ),



        ],


      ),


    );


  }


}