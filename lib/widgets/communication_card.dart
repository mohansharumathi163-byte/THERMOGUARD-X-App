import 'package:flutter/material.dart';

import '../models/communication_model.dart';



class CommunicationCard extends StatelessWidget {


  final CommunicationModel communication;



  const CommunicationCard({

    super.key,

    required this.communication,

  });




  @override
  Widget build(BuildContext context) {


    return Card(


      color: Colors.blueGrey.shade900,


      elevation: 8,


      child: Padding(


        padding:

        const EdgeInsets.all(16),



        child: Column(


          crossAxisAlignment:

          CrossAxisAlignment.start,



          children: [



            const Text(


              "📡 COMMUNICATION SYSTEM",



              style:

              TextStyle(


                color: Colors.white,


                fontSize: 18,


                fontWeight: FontWeight.bold,


              ),


            ),





            const SizedBox(height:15),






            buildStatusRow(

              "Robot Connection",

              communication.robotConnected

                  ?

              "🟢 ${communication.connectionStatus}"

                  :

              "🔴 DISCONNECTED",

            ),






            buildStatusRow(

              "Survivor Voice",

              communication.survivorVoiceDetected

                  ?

              "⚠️ Detected"

                  :

              "No Voice Detected",

            ),






            buildStatusRow(

              "Voice Status",

              communication.voiceStatus,

            ),




          ],


        ),


      ),


    );


  }






  Widget buildStatusRow(

      String title,

      String value

      ){


    return Padding(


      padding:

      const EdgeInsets.symmetric(

          vertical:5

      ),



      child: Row(



        crossAxisAlignment:

        CrossAxisAlignment.start,



        children: [



          Text(


            "$title : ",


            style:

            const TextStyle(


              color: Colors.white70,


              fontWeight: FontWeight.bold,


            ),


          ),




          Expanded(


            child:

            Text(


              value,


              style:

              const TextStyle(


                color: Colors.white,


              ),


            ),


          )



        ],


      ),


    );


  }



}