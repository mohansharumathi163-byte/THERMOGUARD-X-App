import '../models/robot_action_model.dart';



class RobotActionService {



  RobotActionModel decideAction({


    required String fireType,


    required double temperature,


    required String severity,


  }) {



    String movement;

    String extinguisher;

    String mode;

    String safety;

    String message;




// Electrical Fire

    if(fireType == "Electrical Fire"){



      extinguisher =
      "Dry Powder Extinguisher";



      movement =
      "Move Slowly Towards Fire";



      mode =
      "SUPPRESSION MODE";



      safety =
      "Water System Locked";



      message =
      "Electrical fire detected. Dry powder activated";



    }




// Chemical Fire

    else if(fireType == "Chemical Fire"){



      extinguisher =
      "Foam + Dry Powder";



      movement =
      "Maintain Distance";



      mode =
      "HAZARD MODE";



      safety =
      "Chemical Protection Enabled";



      message =
      "Chemical fire detected. Avoid direct approach";



    }





// Normal Fire

    else {



      extinguisher =
      "Water Mist";



      movement =
      "Approach Fire Source";



      mode =
      "FIRE CONTROL MODE";



      safety =
      "Normal Operation";



      message =
      "Cooling operation started";



    }





    if(temperature > 900){


      mode =
      "EMERGENCY MODE";


      movement =
      "Retreat and Alert Team";


      message =
      "Extreme temperature detected. Robot safety activated";


    }





    return RobotActionModel(


      movement: movement,


      extinguisher: extinguisher,


      robotMode: mode,


      safetyStatus: safety,


      message: message,


    );



  }


}