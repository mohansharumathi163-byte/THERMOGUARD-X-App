import 'package:camera/camera.dart';

import '../models/camera_model.dart';



class CameraService {


  CameraController? controller;


  List<CameraDescription> cameras = [];



  Future<void> initializeCamera() async {


    cameras = await availableCameras();



    if(cameras.isEmpty){

      throw Exception(
        "No camera available",
      );

    }



    controller = CameraController(

      cameras.first,

      ResolutionPreset.high,

      enableAudio: true,

    );



    await controller!.initialize();


  }








  Future<CameraModel> getCameraStatus() async {


    return CameraModel(


      cameraType:

      "RGB Camera",



      isActive:

      controller != null &&

          controller!.value.isInitialized,



      resolution:

      "1920 x 1080",



      status:

      controller != null &&

          controller!.value.isInitialized

          ?

      "CONNECTED"

          :

      "DISCONNECTED",



      isRecording:

      controller?.value.isRecordingVideo ?? false,



      imageCaptured:

      false,



      mode:

      "RGB",



    );


  }









  Future<CameraModel> switchCamera(

      String mode

      ) async {



    return CameraModel(


      cameraType:

      mode == "RGB"

          ?

      "RGB Camera"

          :

      "Thermal Camera",



      isActive:

      controller != null &&

          controller!.value.isInitialized,



      resolution:

      "1920 x 1080",



      status:

      "CONNECTED",



      isRecording:

      controller?.value.isRecordingVideo ?? false,



      imageCaptured:

      false,



      mode:

      mode,



    );


  }









  Future<XFile?> captureImage() async {



    if(controller == null ||

        !controller!.value.isInitialized){


      return null;


    }



    if(controller!.value.isTakingPicture){


      return null;


    }




    return await controller!.takePicture();



  }









  Future<void> startRecording() async {



    if(controller != null &&

        controller!.value.isInitialized &&

        !controller!.value.isRecordingVideo){



      await controller!.startVideoRecording();


    }



  }









  Future<XFile?> stopRecording() async {



    if(controller != null &&

        controller!.value.isRecordingVideo){



      return await controller!.stopVideoRecording();


    }



    return null;


  }









  CameraController? getCameraController(){


    return controller;


  }









  bool isCameraReady(){


    return controller != null &&

        controller!.value.isInitialized;


  }









  Future<void> disposeCamera() async {


    await controller?.dispose();


    controller = null;


  }



}