import 'package:flutter/material.dart';

import '../models/survivor_model.dart';
import '../screens/survivor_details_screen.dart';



class SurvivorCard extends StatelessWidget {


  final Survivor survivor;



  const SurvivorCard({

    super.key,

    required this.survivor,

  });






  Color priorityColor(){


    if(survivor.priority == "CRITICAL"){

      return Colors.red;

    }


    else if(survivor.priority == "HIGH"){

      return Colors.orange;

    }


    else{

      return Colors.green;

    }


  }








  @override
  Widget build(BuildContext context) {



    return Card(


      elevation:10,


      color:Colors.grey.shade900,


      shape: RoundedRectangleBorder(

        borderRadius:
        BorderRadius.circular(18),

      ),



      margin:
      const EdgeInsets.only(bottom:18),





      child: Padding(


        padding:
        const EdgeInsets.all(18),




        child: Column(



          crossAxisAlignment:
          CrossAxisAlignment.start,




          children: [






            Row(


              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,



              children: [



                Text(


                  "🧍 Survivor ${survivor.id}",


                  style:
                  const TextStyle(


                    color:Colors.white,


                    fontSize:22,


                    fontWeight:
                    FontWeight.bold,


                  ),



                ),





                Container(


                  padding:
                  const EdgeInsets.symmetric(

                    horizontal:12,

                    vertical:6,

                  ),



                  decoration:
                  BoxDecoration(


                    color:
                    priorityColor(),



                    borderRadius:
                    BorderRadius.circular(20),



                  ),




                  child:Text(


                    survivor.priority,


                    style:
                    const TextStyle(


                      color:Colors.white,


                      fontWeight:
                      FontWeight.bold,


                    ),


                  ),


                )




              ],



            ),







            const SizedBox(height:20),






            // AI INFORMATION



            _infoTile(

              Icons.memory,

              "AI Confidence",

              "${survivor.confidence}%",

            ),





            _infoTile(

              Icons.camera_alt,

              "Detection Source",

              survivor.detectionSource,

            ),







            const Divider(

              color:Colors.white24,

            ),







            // LOCATION INFORMATION



            _infoTile(

              Icons.location_city,

              "Building",

              survivor.building,

            ),





            _infoTile(

              Icons.room,

              "Room Location",

              "${survivor.floor} - ${survivor.room}",

            ),





            _infoTile(

              Icons.navigation,

              "Distance",

              "${survivor.distance} meters (${survivor.direction})",

            ),








            const Divider(

              color:Colors.white24,

            ),







            // HEALTH INFORMATION



            _infoTile(

              Icons.favorite,

              "Heart Rate",

              "${survivor.heartRate} BPM",

            ),





            _infoTile(

              Icons.thermostat,

              "Body Temperature",

              "${survivor.bodyTemperature} °C",

            ),






            _infoTile(

              Icons.directions_walk,

              "Movement Status",

              survivor.movementStatus,

            ),






            _infoTile(

              Icons.record_voice_over,

              "Voice Status",

              survivor.voiceStatus,

            ),







            const Divider(

              color:Colors.white24,

            ),







            // RESCUE STATUS



            _infoTile(

              Icons.warning,

              "Rescue Status",

              survivor.rescueStatus,

            ),






            _infoTile(

              Icons.access_time,

              "Detected Time",

              survivor.detectedTime,

            ),








            const SizedBox(height:20),







            SizedBox(


              width:
              double.infinity,



              child:
              ElevatedButton.icon(



                icon:
                const Icon(

                  Icons.health_and_safety,

                ),





                label:
                const Text(

                  "OPEN RESCUE PROFILE",

                ),





                onPressed:(){



                  Navigator.push(



                    context,



                    MaterialPageRoute(



                      builder:(context)=>



                          SurvivorDetailsScreen(



                            survivor:survivor,



                          ),



                    ),



                  );



                },



              ),


            )





          ],


        ),



      ),



    );



  }








  Widget _infoTile(

      IconData icon,

      String title,

      String value,

      ){



    return Padding(



      padding:

      const EdgeInsets.symmetric(

        vertical:6,

      ),




      child:Row(



        children:[



          Icon(

            icon,

            color:
            Colors.orange,

          ),





          const SizedBox(width:12),







          Expanded(



            child:Column(



              crossAxisAlignment:

              CrossAxisAlignment.start,



              children:[



                Text(

                  title,

                  style:
                  const TextStyle(

                    color:
                    Colors.white70,

                    fontSize:13,

                  ),

                ),






                Text(

                  value,

                  style:
                  const TextStyle(

                    color:
                    Colors.white,

                    fontSize:16,

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),



              ],


            ),



          )



        ],



      ),



    );



  }


}