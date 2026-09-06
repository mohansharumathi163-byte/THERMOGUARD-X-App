import 'package:flutter/material.dart';

import '../models/fire_model.dart';



class FireDetectionCard extends StatelessWidget {


  final FireModel fire;



  const FireDetectionCard({

    super.key,

    required this.fire,

  });




  @override
  Widget build(BuildContext context) {


    return Card(


      color: Colors.grey.shade900,



      child: Padding(


        padding: const EdgeInsets.all(16),



        child: Column(



          crossAxisAlignment:
          CrossAxisAlignment.start,



          children: [





            Row(



              children: [



                const Icon(


                  Icons.local_fire_department,


                  color: Colors.red,


                  size:32,


                ),




                const SizedBox(width:10),





                Text(


                  "FIRE DETECTION SYSTEM",


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






            const SizedBox(height:15),






            _fireRow(

              "Fire Status",

              fire.fireStatus,

              Colors.red,

            ),





            _fireRow(

              "Fire Type",

              fire.fireType,

              Colors.orange,

            ),





            _fireRow(

              "Temperature",

              "${fire.temperature} °C",

              Colors.deepOrange,

            ),





            _fireRow(

              "Smoke Level",

              fire.smokeLevel,

              Colors.grey,

            ),





            _fireRow(

              "Gas Status",

              fire.gasLevel,

              Colors.yellow,

            ),





            _fireRow(

              "Intensity",

              fire.intensity,

              Colors.redAccent,

            ),





            _fireRow(

              "Location",

              fire.location,

              Colors.blue,

            ),





            _fireRow(

              "Detection Source",

              fire.detectionSource,

              Colors.green,

            ),



          ],


        ),


      ),


    );


  }







  Widget _fireRow(


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


              style: const TextStyle(


                color: Colors.white70,

              ),


            ),



          ),






          Flexible(



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