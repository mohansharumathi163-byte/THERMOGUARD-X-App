import 'package:flutter/material.dart';

import '../models/navigation_model.dart';
import '../services/navigation_service.dart';

import '../widgets/indoor_map_widget.dart';



class NavigationScreen extends StatefulWidget {


  const NavigationScreen({

    super.key,

  });



  @override
  State<NavigationScreen> createState() =>
      _NavigationScreenState();


}





class _NavigationScreenState
    extends State<NavigationScreen> {



  final NavigationService navigationService =
  NavigationService();



  NavigationModel? navigation;




  @override
  void initState(){

    super.initState();

    loadNavigation();

  }






  Future<void> loadNavigation() async {


    final result =

    await navigationService.getNavigationData();




    if(mounted){


      setState((){


        navigation = result;


      });


    }


  }








  @override
  Widget build(BuildContext context) {



    return Scaffold(



      backgroundColor:

      Colors.black87,





      appBar: AppBar(


        backgroundColor:

        Colors.red.shade900,



        title:

        const Text(

          "AI INDOOR NAVIGATION",

        ),



        actions: [



          IconButton(

            icon:

            const Icon(Icons.refresh),



            onPressed:

            loadNavigation,

          ),


        ],


      ),







      body:



      navigation == null



          ?



      const Center(



        child:

        CircularProgressIndicator(

          color:

          Colors.red,

        ),



      )





          :



      SingleChildScrollView(



        padding:

        const EdgeInsets.all(16),




        child:

        Column(



          crossAxisAlignment:

          CrossAxisAlignment.start,



          children: [





            IndoorMapWidget(



              navigation:

              navigation!,

            ),






            const SizedBox(height:20),





            _sectionTitle(

              "LOCATION INFORMATION",

            ),






            _infoCard(

              Icons.business,

              "Building",

              navigation!.buildingName,

            ),






            _infoCard(

              Icons.layers,

              "Floor",

              navigation!.floorNumber,

            ),






            _infoCard(

              Icons.smart_toy,

              "Robot Position",

              navigation!.robotPosition,

            ),





            _infoCard(

              Icons.explore,

              "Robot Direction",

              navigation!.robotHeading,

            ),







            const SizedBox(height:15),





            _sectionTitle(

              "RESCUE TARGET",

            ),







            _infoCard(

              Icons.person_search,

              "Survivor Position",

              navigation!.survivorPosition,

            ),






            _infoCard(

              Icons.local_fire_department,

              "Fire Position",

              navigation!.firePosition,

            ),







            const SizedBox(height:15),





            _sectionTitle(

              "AI PATH PLANNING",

            ),








            _infoCard(

              Icons.route,

              "Safe Route",

              navigation!.safeRoute.join(

                  " → "

              ),

            ),






            _infoCard(

              Icons.social_distance,

              "Distance To Survivor",

              "${navigation!.distanceToTarget} meters",

            ),






            _infoCard(

              Icons.timer,

              "Estimated Rescue Time",

              navigation!.estimatedArrivalTime,

            ),








            const SizedBox(height:15),






            _sectionTitle(

              "NAVIGATION SYSTEM STATUS",

            ),







            _infoCard(

              Icons.navigation,

              "Navigation Status",

              navigation!.navigationStatus,

            ),






            _infoCard(

              Icons.directions_walk,

              "Movement Status",

              navigation!.movementStatus,

            ),






            _infoCard(

              Icons.sensors,

              "Mapping Source",

              navigation!.mappingSource,

            ),







            _infoCard(

              Icons.gps_fixed,

              "Location Accuracy",

              "${navigation!.locationAccuracy}%",

            ),






          ],


        ),


      ),


    );


  }









  Widget _sectionTitle(String title){



    return Padding(



      padding:

      const EdgeInsets.only(

        bottom:10,

      ),





      child:

      Text(



        title,



        style:

        const TextStyle(



          color:

          Colors.orange,



          fontSize:

          18,



          fontWeight:

          FontWeight.bold,



        ),



      ),



    );


  }









  Widget _infoCard(



      IconData icon,

      String title,

      String value,



      ){



    return Card(



      color:

      Colors.grey.shade900,



      margin:

      const EdgeInsets.only(

        bottom:12,

      ),





      child:

      ListTile(



        leading:

        Icon(

          icon,

          color:

          Colors.orange,

        ),





        title:

        Text(



          title,



          style:

          const TextStyle(



            color:

            Colors.white70,



          ),



        ),





        subtitle:

        Text(



          value,



          style:

          const TextStyle(



            color:

            Colors.white,



            fontSize:

            16,



            fontWeight:

            FontWeight.bold,



          ),



        ),



      ),



    );



  }



}