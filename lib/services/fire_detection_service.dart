import '../models/fire_ai_model.dart';


class FireDecisionService {



  FireAIModel analyzeFire({


    required String fireType,


    required double temperature,


    required String smokeLevel,


  }) {



    String recommendedAgent;

    String warning;

    String reason;



    // Electrical Fire


    if(fireType == "Electrical Fire"){


      recommendedAgent =
      "Dry Powder";


      warning =
      "DO NOT USE WATER";


      reason =
      "Electrical fire requires non-conductive extinguishing agent";


    }



    // Chemical Fire


    else if(fireType == "Chemical Fire"){


      recommendedAgent =
      "Dry Powder + Foam";


      warning =
      "Maintain Safe Distance";


      reason =
      "Chemical fire requires specialized suppression";


    }




    // Normal Fire


    else {


      recommendedAgent =
      "Water Spray";


      warning =
      "Monitor Temperature";


      reason =
      "Water cooling is suitable for combustible materials";


    }





    double confidence = 90;



    if(temperature > 800){


      confidence = 97;


    }

    else if(temperature > 500){


      confidence = 95;


    }

    else if(temperature > 300){


      confidence = 92;


    }






    return FireAIModel(



      detectedFireType:
      fireType,



      recommendedAgent:
      recommendedAgent,



      confidence:
      confidence,



      safetyWarning:
      warning,



      reason:
      reason,



      aiStatus:
      "DECISION GENERATED",



    );



  }



}