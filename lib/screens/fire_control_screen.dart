import 'package:flutter/material.dart';

import '../models/fire_model.dart';
import '../models/fire_ai_model.dart';
import '../models/robot_command_model.dart';

import '../services/fire_decision_service.dart';
import '../services/extinguishing_controller.dart';
import '../services/robot_communication_service.dart';

import '../widgets/fire_detection_card.dart';
import '../widgets/fire_ai_card.dart';


class FireControlScreen extends StatefulWidget {

  const FireControlScreen({
    super.key,
  });


  @override
  State<FireControlScreen> createState() =>
      _FireControlScreenState();

}



class _FireControlScreenState
    extends State<FireControlScreen> {


  final FireDecisionService decisionService =
  FireDecisionService();



  final ExtinguishingController extinguishingController =
  ExtinguishingController();



  final RobotCommunicationService communicationService =
  RobotCommunicationService();



  bool waterSpray = false;

  bool dryPowder = false;

  bool coolingSystem = false;


  bool robotOnline = false;



  FireAIModel? fireAI;

  RobotCommandModel? lastCommand;



  final FireModel fire = FireModel(

    fireStatus: "ACTIVE",

    fireType: "Electrical Fire",

    temperature: 780,

    smokeLevel: "HIGH",

    gasLevel: "Detected",

    intensity: "CRITICAL",

    location: "Floor 5 - Room 501",

    detectionSource:
    "Thermal Camera + MQ Gas Sensor",

  );




  @override
  void initState() {

    super.initState();


    generateAIResult();

  }





  void generateAIResult(){


    fireAI =
        decisionService.analyzeFire(


          fireType:
          fire.fireType,


          temperature:
          fire.temperature,


          smokeLevel:
          fire.smokeLevel,


        );


  }







  Future<void> startAutoSuppression() async {


    if(fireAI == null){

      return;

    }




    RobotCommandModel command =
    extinguishingController
        .executeDecision(fireAI!);





    bool status =
    await communicationService
        .sendCommand(command);





    setState(() {


      lastCommand = command;


      robotOnline = status;



      waterSpray =
          command.waterPump;



      dryPowder =
          command.dryPowderValve;



      coolingSystem =
          command.coolingFan;



    });






    ScaffoldMessenger.of(context)
        .showSnackBar(


      SnackBar(

        content: Text(

          status

              ? "Robot executing: ${command.command}"

              : "Robot connection failed",

        ),

      ),


    );



  }








  Future<void> emergencyStop() async {



    bool result =
    await communicationService
        .emergencyStop();




    ScaffoldMessenger.of(context)
        .showSnackBar(



      SnackBar(



        content:

        Text(

          result

              ? "Robot Emergency Stop Activated"

              : "Robot Offline",

        ),


      ),


    );



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

          "FIRE CONTROL CENTER",

        ),


      ),






      body:

      SingleChildScrollView(



        padding:
        const EdgeInsets.all(16),





        child:

        Column(



          children: [






            FireDetectionCard(

              fire: fire,

            ),







            const SizedBox(height:20),







            if(fireAI != null)

              FireAICard(

                fireAI: fireAI!,

              ),








            const SizedBox(height:20),







            _title(
                "MANUAL EXTINGUISHING CONTROL"
            ),






            _controlCard(

              "Water Spray",

              Icons.water_drop,

              waterSpray,

                  (value){

                setState((){

                  waterSpray=value;

                });

              },

            ),






            _controlCard(

              "Dry Powder",

              Icons.cloud,

              dryPowder,

                  (value){

                setState((){

                  dryPowder=value;

                });

              },

            ),








            _controlCard(

              "Cooling Fan",

              Icons.ac_unit,

              coolingSystem,

                  (value){

                setState((){

                  coolingSystem=value;

                });

              },

            ),








            const SizedBox(height:25),







            SizedBox(

              width: double.infinity,


              child: ElevatedButton.icon(



                icon:

                const Icon(

                  Icons.smart_toy,

                ),





                label:

                const Text(

                  "AI AUTO SUPPRESSION MODE",

                ),




                style:

                ElevatedButton.styleFrom(

                  backgroundColor:
                  Colors.red,

                  foregroundColor:
                  Colors.white,

                ),





                onPressed:
                startAutoSuppression,



              ),


            ),









            const SizedBox(height:10),







            SizedBox(

              width:double.infinity,


              child:

              ElevatedButton.icon(



                icon:

                const Icon(

                  Icons.stop_circle,

                ),



                label:

                const Text(

                  "EMERGENCY STOP",

                ),



                style:

                ElevatedButton.styleFrom(

                  backgroundColor:
                  Colors.black,

                  foregroundColor:
                  Colors.red,

                ),





                onPressed:
                emergencyStop,



              ),


            ),







            const SizedBox(height:20),







            if(lastCommand != null)


              Card(



                color:
                Colors.grey.shade900,



                child:

                ListTile(



                  leading:

                  Icon(

                    Icons.wifi,

                    color:

                    robotOnline

                        ? Colors.green

                        : Colors.red,

                  ),




                  title:

                  const Text(

                    "ROBOT COMMUNICATION",

                    style:

                    TextStyle(

                      color:Colors.white,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),





                  subtitle:

                  Text(


                    "Status: ${robotOnline ? "ONLINE":"OFFLINE"}\n"

                        "Command: ${lastCommand!.command}\n"

                        "Water Pump: ${lastCommand!.waterPump}\n"

                        "Dry Powder: ${lastCommand!.dryPowderValve}\n"

                        "Cooling Fan: ${lastCommand!.coolingFan}",



                    style:

                    const TextStyle(

                      color:
                      Colors.white70,

                    ),



                  ),



                ),



              ),




          ],


        ),


      ),



    );


  }









  Widget _title(String text){


    return Align(

      alignment:
      Alignment.centerLeft,


      child:

      Padding(

        padding:

        const EdgeInsets.only(

            bottom:10

        ),


        child:

        Text(

          text,


          style:

          const TextStyle(

            color:
            Colors.orange,

            fontSize:18,

            fontWeight:
            FontWeight.bold,

          ),


        ),

      ),


    );


  }










  Widget _controlCard(

      String title,

      IconData icon,

      bool value,

      Function(bool) onChanged,

      ){



    return Card(



      color:
      Colors.grey.shade900,



      child:

      SwitchListTile(



        secondary:

        Icon(

          icon,

          color:
          Colors.orange,

        ),





        title:

        Text(

          title,

          style:

          const TextStyle(

            color:
            Colors.white,

          ),

        ),




        subtitle:

        Text(

          value

              ? "ACTIVE"

              : "OFF",

          style:

          const TextStyle(

            color:
            Colors.white70,

          ),

        ),





        value:

        value,





        onChanged:

        onChanged,



      ),



    );


  }



}