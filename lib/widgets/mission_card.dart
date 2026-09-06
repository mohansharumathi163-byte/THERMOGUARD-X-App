import 'package:flutter/material.dart';



class MissionCard extends StatelessWidget {


  final String mission;

  final String target;

  final String location;

  final String status;



  const MissionCard({


    super.key,


    required this.mission,


    required this.target,


    required this.location,


    required this.status,


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


                  Icons.assignment,


                  color: Colors.red,

                ),



                const SizedBox(width:10),




                Text(


                  "CURRENT MISSION",


                  style: Theme.of(context)
                      .textTheme
                      .titleLarge,


                ),


              ],


            ),





            const SizedBox(height:15),




            _missionRow(

              "Mission",

              mission,

            ),



            _missionRow(

              "Target",

              target,

            ),




            _missionRow(

              "Location",

              location,

            ),




            _missionRow(

              "Status",

              status,

            ),




          ],


        ),


      ),


    );


  }






  Widget _missionRow(

      String title,

      String value,

      ) {


    return Padding(


      padding: const EdgeInsets.symmetric(

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





          Text(


            value,


            style: const TextStyle(


              fontWeight: FontWeight.bold,


            ),


          ),



        ],


      ),


    );


  }



}