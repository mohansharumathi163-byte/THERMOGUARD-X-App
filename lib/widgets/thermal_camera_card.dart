import 'package:flutter/material.dart';

import '../models/camera_model.dart';



class ThermalCameraCard extends StatelessWidget {


  final CameraModel camera;



  const ThermalCameraCard({

    super.key,

    required this.camera,

  });





  @override
  Widget build(BuildContext context) {


    return Card(


      color: Colors.grey.shade900,


      elevation: 5,


      shape:

      RoundedRectangleBorder(

        borderRadius:

        BorderRadius.circular(15),

      ),



      child: Column(


        children: [



          // Camera Preview Area

          Container(


            height: 200,


            width: double.infinity,


            decoration: BoxDecoration(


              color: Colors.black,


              borderRadius:

              const BorderRadius.only(

                topLeft:

                Radius.circular(15),


                topRight:

                Radius.circular(15),

              ),

            ),



            child: Stack(


              children: [



                const Center(


                  child: Icon(


                    Icons.videocam,


                    size: 70,


                    color: Colors.red,

                  ),

                ),





                Positioned(


                  top: 10,


                  right: 10,


                  child: Container(


                    padding:

                    const EdgeInsets.symmetric(

                      horizontal: 10,

                      vertical: 5,

                    ),



                    decoration:

                    BoxDecoration(


                      color: Colors.red,


                      borderRadius:

                      BorderRadius.circular(10),

                    ),



                    child: Text(


                      camera.mode,


                      style:

                      const TextStyle(


                        color: Colors.white,


                        fontWeight:

                        FontWeight.bold,

                      ),

                    ),



                  ),



                ),



              ],


            ),


          ),







          ListTile(



            leading: Icon(


              Icons.thermostat,


              color: camera.mode == "THERMAL"

                  ? Colors.orange

                  : Colors.blue,

            ),





            title: Text(


              camera.cameraType,


              style:

              const TextStyle(


                color: Colors.white,


                fontWeight:

                FontWeight.bold,

              ),

            ),





            subtitle: Text(



              "Status: ${camera.status}\n"

                  "Resolution: ${camera.resolution}\n"

                  "Recording: ${camera.isRecording ? "ON" : "OFF"}",



              style:

              const TextStyle(


                color: Colors.white70,

              ),

            ),



          ),







          Padding(


            padding:

            const EdgeInsets.all(12),



            child: Row(



              mainAxisAlignment:

              MainAxisAlignment.spaceAround,



              children: [



                Icon(


                  Icons.circle,


                  size: 12,


                  color:

                  camera.isActive

                      ? Colors.green

                      : Colors.red,

                ),




                Text(


                  camera.isActive

                      ? "CONNECTED"

                      : "OFFLINE",



                  style:

                  const TextStyle(

                    color: Colors.white,

                  ),


                ),





                Icon(


                  camera.imageCaptured

                      ? Icons.check_circle

                      : Icons.image,


                  color:

                  camera.imageCaptured

                      ? Colors.green

                      : Colors.white,

                ),



              ],


            ),


          ),



        ],


      ),


    );


  }



}