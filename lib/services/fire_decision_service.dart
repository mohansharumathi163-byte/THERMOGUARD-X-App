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



    switch(fireType){



      case "Electrical Fire":


        recommendedAgent =
        "Dry Powder";


        warning =
        "Avoid Water Usage";


        reason =
        "Electrical fire detected. Non-conductive agent required";


        break;





      case "Chemical Fire":


        recommendedAgent =
        "Dry Powder + Foam";


        warning =
        "Maintain Safe Distance";


        reason =
        "Chemical fire requires specialized suppression";


        break;





      case "Gas Fire":


        recommendedAgent =
        "Dry Powder";


        warning =
        "Stop Gas Supply";


        reason =
        "Gas fire requires powder-based suppression";


        break;





      default:


        recommendedAgent =
        "Water Spray";


        warning =
        "Monitor Temperature";


        reason =
        "Normal combustible fire detected";


    }






    double confidence = 90.0;





    if(temperature >= 700){


      confidence = 95.5;


    }


    else if(temperature >= 400){


      confidence = 92.0;


    }







    if(smokeLevel == "HIGH"){


      confidence += 2;


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

      "AI DECISION GENERATED",


    );


  }



}