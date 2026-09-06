import 'package:flutter/material.dart';
import '../models/camera_model.dart';


class CameraWidget extends StatelessWidget {

  final CameraModel camera;


  const CameraWidget({

    super.key,

    required this.camera,

  });



  @override
  Widget build(BuildContext context) {


    return Card(

      elevation: 8,

      color: Colors.black87,


      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(18),

      ),


      child: Padding(

        padding: const EdgeInsets.all(16),


        child: Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,


          children: [


            // Camera Header

            Row(

              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,


              children: [


                Row(

                  children: [


                    Icon(

                      camera.cameraType ==
                          "Thermal Camera"

                          ? Icons.thermostat

                          : Icons.camera_alt,


                      color: Colors.orange,

                    ),


                    const SizedBox(width:10),


                    Text(

                      camera.cameraType,


                      style: const TextStyle(

                        color: Colors.white,

                        fontSize:20,

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),


                  ],

                ),



                Container(

                  padding:
                  const EdgeInsets.symmetric(

                    horizontal:10,

                    vertical:5,

                  ),


                  decoration: BoxDecoration(

                    color: camera.isActive

                        ? Colors.green

                        : Colors.red,


                    borderRadius:
                    BorderRadius.circular(20),

                  ),



                  child: Text(

                    camera.isActive

                        ? "ONLINE"

                        : "OFFLINE",


                    style: const TextStyle(

                      color: Colors.white,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),

                ),


              ],

            ),



            const SizedBox(height:20),



            // Camera Preview Area

            Container(

              height:220,

              width:double.infinity,


              decoration: BoxDecoration(

                color:

                camera.cameraType ==
                    "Thermal Camera"

                    ? Colors.deepOrange.shade900

                    : Colors.grey.shade800,


                borderRadius:
                BorderRadius.circular(15),

              ),



              child: Center(


                child: Column(

                  mainAxisAlignment:
                  MainAxisAlignment.center,


                  children: [


                    Icon(

                      camera.cameraType ==
                          "Thermal Camera"

                          ? Icons.whatshot

                          : Icons.videocam,


                      size:60,

                      color:Colors.white,

                    ),



                    const SizedBox(height:10),



                    Text(

                      "LIVE CAMERA FEED",


                      style: const TextStyle(

                        color:Colors.white,

                        fontSize:18,

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),


                  ],

                ),


              ),


            ),



            const SizedBox(height:15),



            Text(

              "Resolution : ${camera.resolution}",


              style: const TextStyle(

                color:Colors.white70,

              ),

            ),



            Text(

              "Status : ${camera.status}",


              style: const TextStyle(

                color:Colors.white70,

              ),

            ),



          ],

        ),

      ),

    );


  }

}