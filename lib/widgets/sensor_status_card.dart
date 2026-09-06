import 'package:flutter/material.dart';


class SensorStatusCard extends StatelessWidget {


  final String temperature;

  final String humidity;

  final String smokeLevel;

  final String gasLevel;

  final String signalStrength;



  const SensorStatusCard({

    super.key,


    required this.temperature,


    required this.humidity,


    required this.smokeLevel,


    required this.gasLevel,


    required this.signalStrength,


  });



  @override
  Widget build(BuildContext context) {


    return Card(


      elevation: 8,


      color: Colors.grey.shade900,


      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(15),

      ),



      child: Padding(


        padding: const EdgeInsets.all(16),


        child: Column(


          crossAxisAlignment:

          CrossAxisAlignment.start,



          children: [



            Row(


              children: [



                const Icon(

                  Icons.sensors,

                  color: Colors.green,

                ),



                const SizedBox(width:10),



                const Text(

                  "SENSOR MONITORING",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize:20,

                    fontWeight: FontWeight.bold,

                  ),

                ),



              ],

            ),





            const SizedBox(height:20),




            _sensorRow(

              Icons.thermostat,

              "Temperature",

              temperature,

              Colors.orange,

            ),




            _sensorRow(

              Icons.water_drop,

              "Humidity",

              humidity,

              Colors.blue,

            ),





            _sensorRow(

              Icons.cloud,

              "Smoke Level",

              smokeLevel,

              Colors.grey,

            ),





            _sensorRow(

              Icons.warning,

              "Gas Detection",

              gasLevel,

              Colors.red,

            ),





            _sensorRow(

              Icons.wifi,

              "Signal Strength",

              signalStrength,

              Colors.green,

            ),



          ],


        ),


      ),


    );


  }






  Widget _sensorRow(

      IconData icon,

      String title,

      String value,

      Color color,

      ){



    return Padding(


      padding:

      const EdgeInsets.symmetric(

        vertical:8,

      ),



      child: Row(


        children: [



          Icon(

            icon,

            color:color,

          ),



          const SizedBox(width:12),




          Expanded(


            child: Text(


              title,


              style: const TextStyle(


                color:Colors.white70,

              ),


            ),


          ),





          Text(


            value,


            style: const TextStyle(


              color:Colors.white,

              fontWeight:FontWeight.bold,


            ),


          ),



        ],


      ),


    );


  }


}