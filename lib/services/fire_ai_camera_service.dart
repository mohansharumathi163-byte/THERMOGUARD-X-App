import '../models/fire_detection_model.dart';



class FireAICameraService {



  bool analysing = false;





  Future<FireDetectionModel> analyzeFrame() async {



    if(analysing){


      return FireDetectionModel(


        fireDetected: false,


        fireType: "Analysing",


        temperature: 0,


        confidence: 0,


        severity: "NORMAL",


      );


    }



    analysing = true;




    await Future.delayed(

      const Duration(seconds:1),

    );





    // AI MODEL OUTPUT SIMULATION

    final detection = FireDetectionModel(



      fireDetected: true,



      fireType:

      "Electrical Fire",



      temperature:

      780,



      confidence:

      95.5,



      severity:

      "CRITICAL",



    );





    analysing = false;



    return detection;



  }



}