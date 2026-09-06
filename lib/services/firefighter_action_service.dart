import '../models/firefighter_action_model.dart';


class FirefighterActionService {


  FirefighterActionModel generateAction({

    required String fireType,

    required double temperature,

    required double confidence,

  }) {



    String emergencyLevel;

    String action;

    String robotMode;

    String safetyDistance;

    String priority;




    // Critical Fire Condition

    if(temperature >= 700 || confidence >= 95){


      emergencyLevel = "CRITICAL";


      priority = "HIGH";


      robotMode = "FIRE SUPPRESSION";


      safetyDistance = "Maintain 5 meters distance";



      if(fireType == "Electrical Fire"){


        action =
        "Deploy Dry Powder Agent";


      }


      else if(fireType == "Chemical Fire"){


        action =
        "Deploy Foam + Dry Powder";


      }


      else{


        action =
        "Deploy Water Spray";


      }



    }




    // Medium Fire Condition

    else if(temperature >= 400){


      emergencyLevel = "WARNING";


      priority = "MEDIUM";


      robotMode = "MONITORING";


      safetyDistance =
      "Maintain 10 meters distance";


      action =
      "Prepare Extinguishing System";



    }





    // Low Fire Condition

    else{


      emergencyLevel = "LOW";


      priority = "LOW";


      robotMode =
      "SURVEILLANCE";


      safetyDistance =
      "Safe Distance Maintain";


      action =
      "Continue Fire Monitoring";


    }






    return FirefighterActionModel(


      emergencyLevel:
      emergencyLevel,


      recommendedAction:
      action,


      robotMode:
      robotMode,


      safetyDistance:
      safetyDistance,


      priority:
      priority,


    );



  }


}