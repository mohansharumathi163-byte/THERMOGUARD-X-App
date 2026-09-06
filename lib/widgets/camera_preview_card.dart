import 'package:flutter/material.dart';



class CameraPreviewCard extends StatelessWidget {


  final String cameraType;

  final String status;

  final String resolution;



  const CameraPreviewCard({


    super.key,


    required this.cameraType,


    required this.status,


    required this.resolution,


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

                  Icons.videocam,

                  color: Colors.red,

                ),




                const SizedBox(width:10),




                Text(


                  "LIVE ROBOT CAMERA",


                  style: Theme.of(context)
                      .textTheme
                      .titleLarge,


                ),



              ],


            ),




            const SizedBox(height:15),




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


                  Icons.camera_alt,


                  size:60,


                  color: Colors.white54,


                ),


              ),


            ),




            const SizedBox(height:15),




            Row(


              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,


              children: [



                Text(

                  cameraType,

                  style: const TextStyle(

                    fontWeight: FontWeight.bold,

                  ),

                ),



                Text(

                  status,

                  style: const TextStyle(

                    color: Colors.green,

                    fontWeight: FontWeight.bold,

                  ),

                ),



              ],


            ),




            const SizedBox(height:8),




            Text(

              "Resolution: $resolution",

            ),




          ],


        ),


      ),


    );


  }


}