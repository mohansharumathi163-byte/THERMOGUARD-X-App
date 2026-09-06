import 'package:flutter/material.dart';
import '../models/communication_model.dart';


class VoiceStatusCard extends StatelessWidget {

  final CommunicationModel communication;


  const VoiceStatusCard({

    super.key,

    required this.communication,

  });



  @override
  Widget build(BuildContext context) {


    return Card(

      color: Colors.grey.shade900,

      elevation: 8,


      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(18),

      ),



      child: Padding(

        padding: const EdgeInsets.all(16),


        child: Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,


          children: [



            const Text(

              "COMMUNICATION STATUS",

              style: TextStyle(

                color: Colors.orange,

                fontSize:18,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height:15),



            ListTile(

              leading: Icon(

                Icons.wifi,

                color: communication.robotConnected

                    ? Colors.green

                    : Colors.red,

              ),


              title: const Text(

                "Robot Connection",

                style: TextStyle(

                  color: Colors.white,

                ),

              ),



              subtitle: Text(

                communication.connectionStatus,


                style: const TextStyle(

                  color: Colors.white70,

                ),

              ),


            ),





            ListTile(

              leading: Icon(

                Icons.record_voice_over,

                color: communication.survivorVoiceDetected

                    ? Colors.green

                    : Colors.grey,

              ),



              title: const Text(

                "Survivor Voice Detection",

                style: TextStyle(

                  color: Colors.white,

                ),

              ),



              subtitle: Text(

                communication.voiceStatus,


                style: const TextStyle(

                  color: Colors.white70,

                ),

              ),



            ),


          ],

        ),

      ),

    );

  }

}