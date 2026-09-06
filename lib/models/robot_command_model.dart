class RobotCommandModel {


  final String command;

  final bool waterPump;

  final bool dryPowderValve;

  final bool coolingFan;


  RobotCommandModel({

    required this.command,

    required this.waterPump,

    required this.dryPowderValve,

    required this.coolingFan,

  });



  Map<String,dynamic> toJson(){


    return {

      "command": command,

      "waterPump": waterPump,

      "dryPowderValve": dryPowderValve,

      "coolingFan": coolingFan,

    };


  }


}