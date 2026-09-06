import 'package:flutter/material.dart';

import '../models/robot_command_model.dart';
import '../services/robot_communication_service.dart';



class RobotCommunicationScreen extends StatefulWidget {


  const RobotCommunicationScreen({
    super.key,
  });



  @override
  State<RobotCommunicationScreen> createState() =>
      _RobotCommunicationScreenState();


}







class _RobotCommunicationScreenState
    extends State<RobotCommunicationScreen> {



  final RobotCommunicationService communicationService =
  RobotCommunicationService();



  String lastCommand =
      "No Command Sent";



  String connectionStatus =
      "Checking...";



  @override
  void initState(){

    super.initState();

    checkConnection();

  }







  Future<void> checkConnection() async {


    final status =
    await communicationService
        .getRobotConnectionStatus();



    setState((){


      connectionStatus = status;


    });


  }









  Future<void> sendRobotCommand(
      String command
      ) async {



    RobotCommandModel robotCommand =
    RobotCommandModel(


      command: command,


      waterPump: false,


      dryPowderValve: false,


      coolingFan: false,


    );






    final result =
    await communicationService
        .sendCommand(robotCommand);





    if(result){


      setState((){


        lastCommand = command;


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

          "ROBOT COMMUNICATION",

        ),


      ),







      body:

      Padding(



        padding:
        const EdgeInsets.all(16),



        child:

        Column(



          children: [





            Card(



              color:
              Colors.grey.shade900,



              child:

              ListTile(



                leading:

                const Icon(

                  Icons.wifi,

                  color:
                  Colors.green,

                ),





                title:

                const Text(

                  "Robot Connection",

                  style:

                  TextStyle(

                    color:
                    Colors.white,

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),





                subtitle:

                Text(

                  connectionStatus,

                  style:

                  const TextStyle(

                    color:
                    Colors.white70,

                  ),

                ),



              ),



            ),







            const SizedBox(height:20),







            const Text(

              "MOVEMENT COMMANDS",

              style:

              TextStyle(

                color:
                Colors.orange,

                fontSize:20,

                fontWeight:
                FontWeight.bold,

              ),

            ),








            const SizedBox(height:20),






            commandButton(

              "MOVE FORWARD",

              Icons.arrow_upward,

              "MOVE_FORWARD",

            ),






            Row(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [



                commandButton(

                  "LEFT",

                  Icons.arrow_back,

                  "TURN_LEFT",

                ),





                const SizedBox(width:20),





                commandButton(

                  "RIGHT",

                  Icons.arrow_forward,

                  "TURN_RIGHT",

                ),



              ],


            ),







            commandButton(

              "MOVE BACKWARD",

              Icons.arrow_downward,

              "MOVE_BACKWARD",

            ),








            const SizedBox(height:30),







            const Text(

              "EMERGENCY CONTROL",

              style:

              TextStyle(

                color:
                Colors.red,

                fontSize:20,

                fontWeight:
                FontWeight.bold,

              ),

            ),







            const SizedBox(height:15),







            SizedBox(


              width:
              double.infinity,



              child:

              ElevatedButton.icon(



                icon:

                const Icon(

                    Icons.stop

                ),




                label:

                const Text(

                    "EMERGENCY STOP"

                ),




                style:

                ElevatedButton.styleFrom(

                  backgroundColor:
                  Colors.red,

                ),




                onPressed:(){



                  sendRobotCommand(

                      "EMERGENCY_STOP"

                  );



                },



              ),



            ),







            const SizedBox(height:30),







            Card(


              color:
              Colors.grey.shade900,



              child:

              ListTile(



                title:

                const Text(

                  "LAST COMMAND",

                  style:

                  TextStyle(

                    color:
                    Colors.white70,

                  ),

                ),





                subtitle:

                Text(

                  lastCommand,

                  style:

                  const TextStyle(

                    color:
                    Colors.greenAccent,

                    fontSize:18,

                  ),

                ),



              ),



            ),





          ],


        ),


      ),


    );


  }








  Widget commandButton(

      String text,

      IconData icon,

      String command,

      ){


    return Padding(


      padding:
      const EdgeInsets.all(8),


      child:

      ElevatedButton.icon(



        icon:

        Icon(icon),




        label:

        Text(text),




        onPressed:(){


          sendRobotCommand(command);


        },


      ),


    );


  }



}