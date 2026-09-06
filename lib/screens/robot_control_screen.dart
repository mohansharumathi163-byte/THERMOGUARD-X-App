import 'package:flutter/material.dart';

import '../models/robot_command_model.dart';
import '../services/robot_communication_service.dart';



class RobotControlScreen extends StatefulWidget {


  const RobotControlScreen({
    super.key,
  });



  @override
  State<RobotControlScreen> createState() =>
      _RobotControlScreenState();

}





class _RobotControlScreenState
    extends State<RobotControlScreen> {



  final RobotCommunicationService communicationService =
  RobotCommunicationService();




  String lastCommand =
      "No Command";



  bool robotOnline = true;





  Future<void> sendRobotCommand(String command) async {



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




    setState((){


      lastCommand = command;


      robotOnline = result;


    });



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

          "ROBOT CONTROL PANEL",

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
                Icon(


                  Icons.smart_toy,


                  color:

                  robotOnline

                      ?

                  Colors.green

                      :

                  Colors.red,


                ),




                title:
                const Text(


                  "Robot Connection",


                  style:
                  TextStyle(

                    color: Colors.white,

                    fontWeight:
                    FontWeight.bold,

                  ),


                ),




                subtitle:
                Text(


                  robotOnline

                      ?

                  "ROBOT ONLINE"

                      :

                  "ROBOT OFFLINE",


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


              "MOVEMENT CONTROL",


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







            ElevatedButton.icon(



              icon:
              const Icon(Icons.arrow_upward),



              label:
              const Text(
                  "MOVE FORWARD"
              ),



              onPressed: (){

                sendRobotCommand(
                    "MOVE_FORWARD"
                );

              },


            ),







            Row(


              mainAxisAlignment:
              MainAxisAlignment.center,


              children: [



                ElevatedButton.icon(



                  icon:
                  const Icon(Icons.arrow_back),



                  label:
                  const Text("LEFT"),



                  onPressed: (){


                    sendRobotCommand(
                        "TURN_LEFT"
                    );


                  },


                ),





                const SizedBox(width:20),





                ElevatedButton.icon(



                  icon:
                  const Icon(Icons.arrow_forward),



                  label:
                  const Text("RIGHT"),



                  onPressed: (){


                    sendRobotCommand(
                        "TURN_RIGHT"
                    );


                  },


                ),



              ],


            ),







            ElevatedButton.icon(



              icon:
              const Icon(Icons.arrow_downward),



              label:
              const Text(
                  "MOVE BACKWARD"
              ),



              onPressed: (){


                sendRobotCommand(
                    "MOVE_BACKWARD"
                );


              },


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
                const Icon(Icons.stop),



                label:
                const Text(

                    "EMERGENCY STOP"

                ),



                style:
                ElevatedButton.styleFrom(


                  backgroundColor:
                  Colors.red,


                ),



                onPressed: (){


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



}