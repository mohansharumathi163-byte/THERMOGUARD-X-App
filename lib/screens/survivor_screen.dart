import 'package:flutter/material.dart';

import '../models/survivor_model.dart';
import '../models/survivor_tracking_model.dart';

import '../services/survivor_detection_service.dart';
import '../services/ai_survivor_detection_service.dart';
import '../services/survivor_tracking_service.dart';


import '../widgets/survivor_card.dart';
import '../widgets/survivor_ai_card.dart';
import '../widgets/thermal_analysis_card.dart';
import '../widgets/rescue_priority_card.dart';
import '../widgets/survivor_tracking_card.dart';



class SurvivorScreen extends StatefulWidget {


  const SurvivorScreen({

    super.key,

  });



  @override
  State<SurvivorScreen> createState() =>
      _SurvivorScreenState();


}






class _SurvivorScreenState
    extends State<SurvivorScreen> {



  final SurvivorDetectionService detectionService =
  SurvivorDetectionService();



  final AISurvivorDetectionService aiService =
  AISurvivorDetectionService();



  final SurvivorTrackingService trackingService =
  SurvivorTrackingService();





  List<Survivor> survivors = [];



  SurvivorTrackingModel? tracking;



  bool isScanning = true;



  String aiStatus =
      "Starting AI Thermal Analysis...";



  double aiConfidence = 0;








  @override
  void initState(){

    super.initState();

    startDetection();

  }









  Future<void> startDetection() async {


    try{


      setState((){


        isScanning = true;


        aiStatus =
        "Analysing Thermal Camera Feed...";


      });






      final aiResult =
      await aiService.analyzeThermalFrame();






      final result =
      await detectionService.detectSurvivors();







      final trackingResult =
      await trackingService.getTrackingData();







      if(mounted){


        setState((){


          aiConfidence =
              aiResult.confidence;



          aiStatus =
              aiResult.status;



          survivors =
              result;



          tracking =
              trackingResult;



          isScanning = false;



        });


      }





    }


    catch(e){


      debugPrint(

          "Survivor Detection Error: $e"

      );



      if(mounted){


        setState((){


          isScanning = false;



          aiStatus =
          "AI Detection Failed";



        });


      }



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

          "AI SURVIVOR DETECTION",

        ),




        actions: [



          IconButton(



            icon:
            const Icon(

              Icons.refresh,

            ),



            onPressed:

            isScanning

                ?

            null

                :

            startDetection,



          ),



        ],



      ),







      body:



      isScanning



          ?



      Center(



        child:

        Column(



          mainAxisAlignment:

          MainAxisAlignment.center,





          children: [



            const CircularProgressIndicator(


              color:

              Colors.red,


            ),





            const SizedBox(height:20),





            Text(


              aiStatus,


              style:

              const TextStyle(


                color:

                Colors.white,


                fontSize:16,


              ),


            ),





            const SizedBox(height:15),





            const Text(



              "AI Model: Thermal Vision + Human Detection",



              style:

              TextStyle(



                color:

                Colors.white70,



              ),



            ),




          ],



        ),



      )






          :



      SingleChildScrollView(



        padding:

        const EdgeInsets.all(16),




        child:

        Column(



          crossAxisAlignment:

          CrossAxisAlignment.start,





          children: [






            SurvivorAICard(



              detectionStatus:



              survivors.isNotEmpty

                  ?

              "HUMAN DETECTED"

                  :

              "NO SURVIVOR FOUND",






              confidence:



              survivors.isNotEmpty

                  ?

              "${aiConfidence.toStringAsFixed(1)}%"

                  :

              "0%",






              detectionSource:



              survivors.isNotEmpty

                  ?

              survivors.first.detectionSource

                  :

              "Thermal Camera",






              detectionTime:



              survivors.isNotEmpty

                  ?

              survivors.first.detectedTime

                  :

              "--",




            ),







            const SizedBox(height:20),








            if(survivors.isNotEmpty)



              ThermalAnalysisCard(



                heatSignature:

                "Human Heat Signature Detected",




                bodyTemperature:

                "${survivors.first.bodyTemperature} °C",




                movementStatus:

                survivors.first.movementStatus,




                trackingStatus:

                "AI TRACKING LOCKED",



              ),







            const SizedBox(height:20),








            if(survivors.isNotEmpty)



              RescuePriorityCard(



                priorityLevel:

                survivors.first.priority,




                reason:

                "AI Thermal Detection + Human Confirmation",




                survivorCondition:

                "Heart Rate ${survivors.first.heartRate} BPM",




                recommendedAction:

                "Immediate Rescue Required",



              ),







            const SizedBox(height:20),







            if(tracking != null)



              SurvivorTrackingCard(



                tracking:

                tracking!,



              ),








            const SizedBox(height:20),







            Card(



              color:

              Colors.grey.shade900,





              child:

              ListTile(



                leading:

                const Icon(



                  Icons.smart_toy,


                  color:

                  Colors.green,


                ),





                title:

                const Text(



                  "AI SYSTEM STATUS",



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



                  "Status: $aiStatus\n"

                      "Confidence: ${aiConfidence.toStringAsFixed(1)}%\n"

                      "Detection: Thermal Camera + AI Vision",





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



              "SURVIVOR DETAILS",




              style:

              TextStyle(



                color:

                Colors.white,


                fontSize:20,


                fontWeight:

                FontWeight.bold,


              ),




            ),






            const SizedBox(height:10),








            ListView.builder(



              shrinkWrap:

              true,




              physics:

              const NeverScrollableScrollPhysics(),




              itemCount:

              survivors.length,





              itemBuilder:

                  (context,index){





                return SurvivorCard(



                  survivor:

                  survivors[index],



                );



              },



            ),





          ],



        ),



      ),




    );


  }



}