import '../models/fire_ai_model.dart';
import '../models/robot_command_model.dart';



class ExtinguishingController {



  bool waterPump = false;

  bool dryPowderValve = false;

  bool coolingFan = false;







  RobotCommandModel executeDecision(

      FireAIModel decision

      ) {



    // Reset all systems

    waterPump = false;

    dryPowderValve = false;

    coolingFan = false;






    String command = "";







    if(decision.recommendedAgent
        .contains("Water")) {



      waterPump = true;

      coolingFan = true;


      command =
      "START_WATER_SPRAY";



    }






    else if(decision.recommendedAgent
        .contains("Dry Powder")) {



      dryPowderValve = true;

      coolingFan = true;


      command =
      "START_DRY_POWDER";



    }






    else if(decision.recommendedAgent
        .contains("Foam")) {



      dryPowderValve = true;

      coolingFan = true;


      command =
      "START_FOAM_SUPPRESSION";



    }






    return RobotCommandModel(


      command:
      command,


      waterPump:
      waterPump,


      dryPowderValve:
      dryPowderValve,


      coolingFan:
      coolingFan,


    );



  }



}