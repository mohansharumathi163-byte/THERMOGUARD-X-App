import 'package:flutter/material.dart';

import '../models/survivor_model.dart';

import 'navigation_screen.dart';
import 'communication_screen.dart';



class SurvivorDetailsScreen extends StatelessWidget {


  final Survivor survivor;



  const SurvivorDetailsScreen({

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


    return Scaffold(


      backgroundColor: Colors.black87,


      appBar: AppBar(

        backgroundColor: Colors.red.shade900,

        title: Text(

          "RESCUE PROFILE - ${survivor.id}",

        ),

      ),





      body: SingleChildScrollView(


        padding: const EdgeInsets.all(16),



        child: Column(


          crossAxisAlignment: CrossAxisAlignment.start,



          children: [



            Container(


              width: double.infinity,


              padding: const EdgeInsets.all(18),



              decoration: BoxDecoration(

                color: priorityColor(),

                borderRadius: BorderRadius.circular(18),

              ),



              child: Column(


                children: [



                  const Icon(

                    Icons.warning,

                    color: Colors.white,

                    size:45,

                  ),



                  const SizedBox(height:10),



                  Text(

                    survivor.priority,

                    style: const TextStyle(

                      color: Colors.white,

                      fontSize:26,

                      fontWeight: FontWeight.bold,

                    ),

                  ),



                  const Text(

                    "SURVIVOR DETECTED",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize:16,

                    ),

                  ),


                ],


              ),


            ),




            const SizedBox(height:20),





            _sectionTitle(

              "THERMAL CAMERA ANALYSIS",

            ),





            Card(

              color: Colors.grey.shade900,


              child: Padding(

                padding: const EdgeInsets.all(16),


                child: Column(


                  children: [



                    Container(

                      height:180,

                      width:double.infinity,


                      decoration: BoxDecoration(

                        color: Colors.black,

                        borderRadius:
                        BorderRadius.circular(12),

                        border: Border.all(

                          color: Colors.red,

                          width:2,

                        ),

                      ),



                      child: const Center(

                        child: Icon(

                          Icons.thermostat,

                          color: Colors.red,

                          size:70,

                        ),

                      ),


                    ),




                    const SizedBox(height:15),



                    _dataRow(

                      "Heat Signature",

                      "Human Detected",

                    ),



                    _dataRow(

                      "Tracking Status",

                      "LOCKED",

                    ),



                    _dataRow(

                      "Detection Source",

                      survivor.detectionSource,

                    ),


                  ],


                ),


              ),


            ),






            const SizedBox(height:20),






            _sectionTitle(

              "AI DETECTION ANALYSIS",

            ),




            _dataCard(

              Icons.memory,

              "AI Confidence",

              "${survivor.confidence}%",

            ),



            _dataCard(

              Icons.access_time,

              "Detected Time",

              survivor.detectedTime,

            ),





            const SizedBox(height:20),






            _sectionTitle(

              "LIVE HEALTH MONITORING",

            ),



            _dataCard(

              Icons.favorite,

              "Heart Rate",

              "${survivor.heartRate} BPM",

            ),



            _dataCard(

              Icons.thermostat,

              "Body Temperature",

              "${survivor.bodyTemperature} °C",

            ),



            _dataCard(

              Icons.directions_walk,

              "Movement Status",

              survivor.movementStatus,

            ),



            _dataCard(

              Icons.record_voice_over,

              "Voice Status",

              survivor.voiceStatus,

            ),





            const SizedBox(height:20),





            _sectionTitle(

              "LOCATION TRACKING",

            ),



            _dataCard(

              Icons.location_city,

              "Building",

              survivor.building,

            ),



            _dataCard(

              Icons.location_on,

              "Current Position",

              "${survivor.floor}, ${survivor.room}",

            ),



            _dataCard(

              Icons.navigation,

              "Distance From Robot",

              "${survivor.distance} meters (${survivor.direction})",

            ),






            const SizedBox(height:20),






            _sectionTitle(

              "RESCUE STATUS",

            ),





            _dataCard(

              Icons.warning,

              "Priority Level",

              survivor.priority,

            ),





            _dataCard(

              Icons.health_and_safety,

              "Rescue Status",

              survivor.rescueStatus,

            ),





            const SizedBox(height:20),






            _sectionTitle(

              "RESCUE ACTIONS",

            ),





            _actionButton(

              context,

              "Navigate Robot To Survivor",

              Icons.navigation,

                  (){


                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder:(context)=>

                    const NavigationScreen(),

                  ),

                );


              },

            ),






            _actionButton(

              context,

              "Start Two-Way Communication",

              Icons.mic,

                  (){


                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder:(context)=>

                    const CommunicationScreen(),

                  ),

                );


              },

            ),





            _actionButton(

              context,

              "Send Emergency Alert",

              Icons.notification_important,

                  (){


                ScaffoldMessenger.of(context)

                    .showSnackBar(

                  const SnackBar(

                    content: Text(

                      "Emergency alert sent to rescue team",

                    ),

                  ),

                );


              },

            ),





            _actionButton(

              context,

              "Mark Survivor Rescued",

              Icons.check_circle,

                  (){


                ScaffoldMessenger.of(context)

                    .showSnackBar(

                  const SnackBar(

                    content: Text(

                      "Survivor rescue completed",

                    ),

                  ),

                );


              },

            ),



          ],


        ),


      ),


    );


  }






  Widget _sectionTitle(String title){


    return Padding(

      padding: const EdgeInsets.only(bottom:10),


      child: Text(

        title,

        style: const TextStyle(

          color: Colors.orange,

          fontSize:18,

          fontWeight:FontWeight.bold,

        ),

      ),


    );


  }







  Widget _dataCard(

      IconData icon,

      String title,

      String value,

      ){



    return Card(

      color: Colors.grey.shade900,


      child: ListTile(


        leading: Icon(

          icon,

          color: Colors.orange,

        ),



        title: Text(

          title,

          style: const TextStyle(

            color: Colors.white70,

          ),

        ),



        subtitle: Text(

          value,

          style: const TextStyle(

            color: Colors.white,

            fontWeight: FontWeight.bold,

          ),

        ),


      ),


    );


  }







  Widget _dataRow(

      String title,

      String value,

      ){



    return Padding(

      padding: const EdgeInsets.symmetric(vertical:6),


      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,


        children: [


          Text(

            title,

            style: const TextStyle(

              color: Colors.white70,

            ),

          ),



          Text(

            value,

            style: const TextStyle(

              color: Colors.white,

              fontWeight: FontWeight.bold,

            ),

          ),


        ],


      ),


    );


  }







  Widget _actionButton(

      BuildContext context,

      String text,

      IconData icon,

      VoidCallback action,

      ){


    return Container(

      width:double.infinity,


      margin:const EdgeInsets.only(bottom:10),



      child: ElevatedButton.icon(

        icon:Icon(icon),

        label:Text(text),

        onPressed:action,

      ),


    );


  }


}