import 'package:flutter/material.dart';



class ThermalAnalysisCard extends StatelessWidget {


  final String heatSignature;

  final String bodyTemperature;

  final String movementStatus;

  final String trackingStatus;



  const ThermalAnalysisCard({


    super.key,


    required this.heatSignature,


    required this.bodyTemperature,


    required this.movementStatus,


    required this.trackingStatus,


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

                  Icons.thermostat,

                  color: Colors.orange,

                  size:30,

                ),




                const SizedBox(width:10),




                Text(


                  "THERMAL ANALYSIS",


                  style: Theme.of(context)
                      .textTheme
                      .titleLarge,


                ),


              ],


            ),





            const SizedBox(height:15),





            _thermalRow(

              Icons.local_fire_department,

              "Heat Signature",

              heatSignature,

              Colors.red,

            ),





            _thermalRow(

              Icons.device_thermostat,

              "Body Temperature",

              bodyTemperature,

              Colors.orange,

            ),





            _thermalRow(

              Icons.directions_run,

              "Movement",

              movementStatus,

              Colors.blue,

            ),





            _thermalRow(

              Icons.track_changes,

              "Tracking",

              trackingStatus,

              Colors.green,

            ),




          ],


        ),


      ),


    );


  }






  Widget _thermalRow(

      IconData icon,

      String title,

      String value,

      Color color,

      ) {


    return Padding(


      padding:
      const EdgeInsets.symmetric(

        vertical:8,

      ),



      child: Row(


        children: [



          Icon(

            icon,

            color: color,

          ),



          const SizedBox(width:12),





          Expanded(


            child: Text(

              title,

            ),

          ),





          Text(


            value,


            style: TextStyle(

              color: color,

              fontWeight:
              FontWeight.bold,

            ),


          ),



        ],


      ),


    );


  }


}