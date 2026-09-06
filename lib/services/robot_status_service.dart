import '../models/robot_status_model.dart';



class RobotStatusService {



  Future<RobotStatusModel> getRobotStatus() async {



    await Future.delayed(

      const Duration(seconds:1),

    );



    // Temporary simulated robot sensor values

    // Later these values will come from ESP32 API



    return RobotStatusModel(



      // Power

      battery: 86,



      // Environment sensors

      temperature: 42.5,

      humidity: 45.0,

      smokeLevel: "NORMAL",

      gasLevel: 35.6,



      // Robot movement

      motorStatus: "Running",

      movementStatus: "Moving",



      // Mission

      missionStatus:

      "Rescue Operation Active",



      // Sensor health

      sensorStatus:

      "All Sensors Active",



      // Communication

      signalStrength:

      "Strong",



      connectionStatus:

      "ESP32 Connected",



      // GPS

      latitude:

      11.0168,



      longitude:

      76.9558,



    );



  }



}