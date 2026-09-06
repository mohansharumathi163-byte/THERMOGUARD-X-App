import 'dart:async';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


// MODELS

import '../models/fire_ai_model.dart';
import '../models/camera_model.dart';
import '../models/fire_detection_model.dart';
import '../models/communication_model.dart';
import '../models/navigation_model.dart';


// SERVICES

import '../services/camera_service.dart';
import '../services/fire_ai_camera_service.dart';
import '../services/fire_decision_service.dart';
import '../services/communication_service.dart';
import '../services/navigation_service.dart';


// WIDGETS

import '../widgets/firefighter_dashboard_card.dart';
import '../widgets/thermal_camera_card.dart';
import '../widgets/fire_overlay_card.dart';
import '../widgets/communication_card.dart';
import '../widgets/navigation_card.dart';



class LiveCameraScreen extends StatefulWidget {


  const LiveCameraScreen({
    super.key,
  });



  @override
  State<LiveCameraScreen> createState() =>
      _LiveCameraScreenState();

}







class _LiveCameraScreenState
    extends State<LiveCameraScreen> {



// SERVICES


final CameraService cameraService =
CameraService();



final FireAICameraService fireAIService =
FireAICameraService();



final FireDecisionService fireDecisionService =
FireDecisionService();



final CommunicationService communicationService =
CommunicationService();



final NavigationService navigationService =
NavigationService();





// MODELS


CameraModel? camera;


FireDetectionModel? fireDetection;


FireAIModel? fireDecision;


CommunicationModel? communication;


NavigationModel? navigation;





CameraController?
cameraController;





bool cameraReady = false;


bool recording = false;


Timer? fireDetectionTimer;






@override
void initState() {


super.initState();


initializeCamera();


startContinuousFireDetection();


loadCommunicationStatus();


loadNavigation();


}








Future<void> initializeCamera() async {


try {


await cameraService.initializeCamera();



final controller =
cameraService.getCameraController();



final result =
await cameraService.getCameraStatus();




if(mounted){


setState(() {


cameraController = controller;


camera = result;


cameraReady =
controller != null;



});


}


}

catch(error){


debugPrint(
"Camera Initialization Error: $error"
);


}


}








Future<void> loadCommunicationStatus() async {


try {


final result =
await communicationService
.getCommunicationStatus();



if(mounted){


setState(() {


communication = result;


});


}


}

catch(error){


debugPrint(
"Communication Error: $error"
);


}


}








Future<void> loadNavigation() async {


try {


final result =
await navigationService
.getNavigationData();




if(mounted){


setState(() {


navigation = result;


});


}


}

catch(error){


debugPrint(
"Navigation Error: $error"
);


}


}








void startContinuousFireDetection(){


fireDetectionTimer =
Timer.periodic(


const Duration(seconds:5),



(timer) async {



try {


final result =
await fireAIService
.analyzeFrame();




final decision =
fireDecisionService
.analyzeFire(


fireType:
result.fireType,


temperature:
result.temperature,


smokeLevel:
"HIGH",


);





if(mounted){


setState(() {


fireDetection = result;


fireDecision = decision;


});



if(result.fireDetected){


showFireAlert(result);


}



}



}

catch(error){


debugPrint(
"AI Fire Detection Error: $error"
);


}


},


);


}








void showFireAlert(
FireDetectionModel detection
){


ScaffoldMessenger.of(context)
.showSnackBar(


SnackBar(


backgroundColor:
Colors.red,


duration:
const Duration(seconds:5),



content:
Text(

"🚨 FIRE ALERT\n"
"${detection.fireType}\n"
"Temperature: ${detection.temperature}°C\n"
"Confidence: ${detection.confidence}%",

),


),


);


}








Future<void> switchCamera() async {


if(camera == null)
{
return;
}



String newMode =
camera!.mode == "RGB"
?
"THERMAL"
:
"RGB";




final result =
await cameraService
.switchCamera(newMode);




if(mounted){


setState(() {


camera = result;


});


}


}








Future<void> captureImage() async {


final image =
await cameraService
.captureImage();




if(image != null){


ScaffoldMessenger.of(context)
.showSnackBar(


SnackBar(

content:
Text(
"Image Saved: ${image.path}"
),

),


);


}


}








Future<void> recordVideo() async {


try {


if(recording){


await cameraService
.stopRecording();



setState(() {


recording = false;


});



}


else{


await cameraService
.startRecording();



setState(() {


recording = true;


});



}



}

catch(error){


debugPrint(
"Recording Error: $error"
);


}


}
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black87,


      appBar: AppBar(

        backgroundColor: Colors.red.shade900,

        title: const Text(
          "LIVE CAMERA CONTROL",
        ),

      ),



      body:


      !cameraReady || cameraController == null


          ?


      const Center(

        child: CircularProgressIndicator(),

      )



          :


      SingleChildScrollView(

        padding:
        const EdgeInsets.all(16),


        child:

        Column(

          children: [



            Container(

              height: 250,

              width: double.infinity,


              decoration: BoxDecoration(

                borderRadius:
                BorderRadius.circular(12),

              ),


              child:

              ClipRRect(

                borderRadius:
                BorderRadius.circular(12),


                child:

                CameraPreview(

                  cameraController!,

                ),

              ),

            ),





            const SizedBox(height:20),





            if(camera != null)

              ThermalCameraCard(

                camera: camera!,

              ),






            const SizedBox(height:20),





            if(fireDetection != null)

              FireOverlayCard(

                detection: fireDetection!,

              ),






            const SizedBox(height:20),





            if(fireDecision != null)

              FirefighterDashboardCard(

                decision: fireDecision!,

              ),






            const SizedBox(height:20),





            if(communication != null)

              CommunicationCard(

                communication: communication!,

              ),






            const SizedBox(height:20),





            if(navigation != null)

              NavigationCard(

                navigation: navigation!,

              ),






            const SizedBox(height:25),





            Row(

              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,


              children: [


                ElevatedButton.icon(

                  icon:

                  const Icon(

                    Icons.switch_camera,

                  ),



                  label:

                  const Text(

                    "Switch",

                  ),



                  onPressed:

                  switchCamera,

                ),






                ElevatedButton.icon(

                  icon:

                  const Icon(

                    Icons.camera_alt,

                  ),



                  label:

                  const Text(

                    "Capture",

                  ),



                  onPressed:

                  captureImage,

                ),



              ],

            ),







            const SizedBox(height:15),






            ElevatedButton.icon(

              style:

              ElevatedButton.styleFrom(

                backgroundColor:

                recording

                    ?

                Colors.red

                    :

                Colors.green,

              ),



              icon:

              Icon(

                recording

                    ?

                Icons.stop

                    :

                Icons.videocam,

              ),



              label:

              Text(

                recording

                    ?

                "STOP RECORDING"

                    :

                "START RECORDING",

              ),



              onPressed:

              recordVideo,


            ),







            const SizedBox(height:25),





            Card(

              color:

              Colors.grey.shade900,



              child:

              ListTile(


                leading:

                const Icon(

                  Icons.smart_toy,

                  color: Colors.green,

                ),





                title:

                const Text(

                  "AI SYSTEM STATUS",

                  style:

                  TextStyle(

                    color: Colors.white,

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),






                subtitle:

                Text(


                  fireDetection == null


                      ?


                  "AI Analysing Thermal Feed..."



                      :



                  "🔥 Fire Detection Active\n"
                      "Type: ${fireDetection!.fireType}\n"
                      "Temperature: ${fireDetection!.temperature}°C\n"
                      "Confidence: ${fireDetection!.confidence}%\n"
                      "AI Decision: ${fireDecision?.recommendedAgent ?? "Processing"}\n"
                      "Communication: ${communication?.connectionStatus ?? "Checking"}\n"
                      "Robot Position: ${navigation?.robotPosition ?? "Loading"}",



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







  @override
  void dispose(){


    fireDetectionTimer?.cancel();



    cameraService.disposeCamera();



    super.dispose();


  }



}