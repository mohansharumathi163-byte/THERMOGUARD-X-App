import 'package:flutter/material.dart';

import '../models/navigation_model.dart';



class IndoorMapWidget extends StatelessWidget {


  final NavigationModel navigation;



  const IndoorMapWidget({

    super.key,

    required this.navigation,

  });







  @override
  Widget build(BuildContext context) {


    return Card(


      elevation:8,


      color:Colors.grey.shade900,



      shape:RoundedRectangleBorder(

        borderRadius:

        BorderRadius.circular(15),

      ),




      child:Padding(


        padding:

        const EdgeInsets.all(16),




        child:Column(



          crossAxisAlignment:

          CrossAxisAlignment.start,



          children:[





            const Text(


              "🗺️ AI BUILDING MAP",

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







            Container(


              height:280,


              width:double.infinity,



              decoration:BoxDecoration(


                color:

                Colors.black,


                borderRadius:

                BorderRadius.circular(12),



                border:

                Border.all(

                  color:

                  Colors.white30,

                ),

              ),





              child:Stack(


                children:[





                  // FLOOR PLAN AREA


                  Center(


                    child:Container(



                      height:190,


                      width:260,



                      decoration:BoxDecoration(


                        border:

                        Border.all(

                          color:

                          Colors.white,

                          width:2,

                        ),



                      ),




                      child:

                      const Center(



                        child:

                        Text(


                          "THERMOGUARD-X\nFLOOR PLAN",



                          textAlign:

                          TextAlign.center,



                          style:

                          TextStyle(

                            color:

                            Colors.white70,

                            fontWeight:

                            FontWeight.bold,

                          ),



                        ),



                      ),



                    ),



                  ),







                  // SAFE ROUTE LINE


                  Positioned(


                    left:70,

                    bottom:90,



                    child:Container(



                      height:3,


                      width:130,



                      color:

                      Colors.green,



                    ),



                  ),








                  // ROBOT MARKER


                  Positioned(



                    left:35,

                    bottom:55,



                    child:_mapMarker(



                      Icons.smart_toy,

                      Colors.blue,

                      navigation.robotPosition,



                    ),



                  ),







                  // SURVIVOR MARKER


                  Positioned(



                    right:35,

                    top:50,



                    child:_mapMarker(



                      Icons.person,

                      Colors.green,

                      navigation.survivorPosition,



                    ),



                  ),







                  // FIRE MARKER


                  Positioned(



                    right:70,

                    bottom:55,



                    child:_mapMarker(



                      Icons.local_fire_department,

                      Colors.red,

                      navigation.firePosition,



                    ),



                  ),





                ],



              ),



            ),






            const SizedBox(height:15),






            _infoRow(

              Icons.route,

              "Safe Route",

              navigation.safeRoute.join(" → "),

            ),





            _infoRow(

              Icons.social_distance,

              "Distance",

              "${navigation.distanceToTarget} meters",

            ),





            _infoRow(

              Icons.timer,

              "ETA",

              navigation.estimatedArrivalTime,

            ),






            _infoRow(

              Icons.navigation,

              "Status",

              navigation.navigationStatus,

            ),





          ],



        ),



      ),



    );



  }










  Widget _mapMarker(

      IconData icon,

      Color color,

      String label,

      ){



    return Column(



      children:[



        Icon(

          icon,

          color:

          color,

          size:

          35,

        ),





        SizedBox(



          width:

          80,



          child:

          Text(



            label,

            textAlign:

            TextAlign.center,



            style:

            const TextStyle(

              color:

              Colors.white,

              fontSize:

              10,

            ),



          ),



        ),



      ],



    );



  }









  Widget _infoRow(

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