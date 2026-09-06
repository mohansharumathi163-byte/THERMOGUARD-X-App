import 'package:flutter/material.dart';

import '../models/navigation_model.dart';



class NavigationCard extends StatelessWidget {


  final NavigationModel navigation;



  const NavigationCard({

    super.key,

    required this.navigation,

  });





  @override
  Widget build(BuildContext context) {


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

              "🗺️ INDOOR NAVIGATION",

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





            _row(

              Icons.location_city,

              "Building",

              navigation.buildingName,

            ),




            _row(

              Icons.layers,

              "Floor",

              navigation.floorNumber,

            ),





            _row(

              Icons.smart_toy,

              "Robot Position",

              navigation.robotPosition,

            ),




            _row(

              Icons.explore,

              "Robot Direction",

              navigation.robotHeading,

            ),





            const Divider(

              color:

              Colors.white24,

            ),




            _row(

              Icons.local_fire_department,

              "Fire Location",

              navigation.firePosition,

            ),




            _row(

              Icons.person,

              "Survivor Location",

              navigation.survivorPosition,

            ),





            const Divider(

              color:

              Colors.white24,

            ),




            _row(

              Icons.route,

              "Safe Route",

              navigation.safeRoute.join(" → "),

            ),




            _row(

              Icons.social_distance,

              "Distance To Survivor",

              "${navigation.distanceToTarget} meters",

            ),




            _row(

              Icons.timer,

              "Estimated Rescue Time",

              navigation.estimatedArrivalTime,

            ),





            const Divider(

              color:

              Colors.white24,

            ),




            _row(

              Icons.navigation,

              "Navigation Status",

              navigation.navigationStatus,

            ),





            _row(

              Icons.directions_walk,

              "Movement Status",

              navigation.movementStatus,

            ),





            _row(

              Icons.sensors,

              "Mapping Source",

              navigation.mappingSource,

            ),





            _row(

              Icons.gps_fixed,

              "Location Accuracy",

              "${navigation.locationAccuracy}%",

            ),





          ],


        ),


      ),


    );


  }







  Widget _row(

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




          const SizedBox(width:10),




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