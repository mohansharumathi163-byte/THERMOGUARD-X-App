import 'package:flutter/material.dart';

import '../models/survivor_tracking_model.dart';



class SurvivorTrackingCard extends StatelessWidget {


  final SurvivorTrackingModel tracking;



  const SurvivorTrackingCard({

    super.key,

    required this.tracking,

  });



  @override
  Widget build(BuildContext context){


    return Card(


      color:

      Colors.grey.shade900,


      elevation:

      8,


      shape:

      RoundedRectangleBorder(

        borderRadius:

        BorderRadius.circular(15),

      ),



      child:

      Padding(


        padding:

        const EdgeInsets.all(16),



        child:

        Column(


          crossAxisAlignment:

          CrossAxisAlignment.start,



          children: [



            const Text(

              "📍 SURVIVOR TRACKING",

              style:

              TextStyle(

                color:

                Colors.orange,

                fontSize:

                20,

                fontWeight:

                FontWeight.bold,

              ),

            ),



            const SizedBox(height:15),




            _trackingRow(

              Icons.person,

              "Survivor ID",

              tracking.survivorId,

            ),




            _trackingRow(

              Icons.social_distance,

              "Distance",

              "${tracking.distance} meters",

            ),





            _trackingRow(

              Icons.navigation,

              "Direction",

              tracking.direction,

            ),





            _trackingRow(

              Icons.smart_toy,

              "Robot Position",

              tracking.robotLocation,

            ),





            _trackingRow(

              Icons.location_on,

              "Survivor Position",

              tracking.survivorLocation,

            ),




            const Divider(

              color:

              Colors.white24,

            ),




            _trackingRow(

              Icons.gps_fixed,

              "Tracking Status",

              tracking.trackingStatus,

            ),




            _trackingRow(

              Icons.analytics,

              "Tracking Accuracy",

              "${tracking.trackingAccuracy}%",

            ),




            _trackingRow(

              Icons.directions_walk,

              "Movement",

              tracking.movementStatus,

            ),




            _trackingRow(

              Icons.sensors,

              "Sensor Source",

              tracking.sensorSource,

            ),




            _trackingRow(

              Icons.wifi,

              "Signal Status",

              tracking.signalStatus,

            ),




            _trackingRow(

              Icons.warning,

              "Rescue Priority",

              tracking.rescuePriority,

            ),





            _trackingRow(

              Icons.timer,

              "Estimated Rescue Time",

              tracking.estimatedRescueTime,

            ),



          ],


        ),


      ),


    );


  }





  Widget _trackingRow(

      IconData icon,

      String title,

      String value,

      ){


    return Padding(

      padding:

      const EdgeInsets.symmetric(

        vertical:6,

      ),



      child:

      Row(

        children: [



          Icon(

            icon,

            color:

            Colors.orange,

            size:

            22,

          ),




          const SizedBox(width:12),




          Expanded(

            child:

            Text(

              title,

              style:

              const TextStyle(

                color:

                Colors.white70,

              ),

            ),

          ),





          Flexible(

            child:

            Text(

              value,

              textAlign:

              TextAlign.right,

              style:

              const TextStyle(

                color:

                Colors.white,

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