import '../models/robot_command_model.dart';
import '../models/robot_connection_model.dart';



class RobotCommunicationService {



  bool robotConnected = true;



  String lastCommand = "No Command";



  String robotIP =
      "192.168.1.100";



  String protocol =
      "MQTT";



  String signalStrength =
      "Strong";







  Future<bool> sendCommand(

      RobotCommandModel command

      ) async {



    if(!robotConnected){


      print("Robot is disconnected");


      return false;


    }







    print("==============================");

    print("THERMOGUARD-X ROBOT COMMUNICATION");

    print("==============================");







    print("Protocol : $protocol");

    print("Robot IP : $robotIP");

    print("Signal : $signalStrength");







    print("Sending Command...");



    print(command.toJson());








    // Simulating MQTT transmission

    await Future.delayed(

      const Duration(seconds:1),

    );







    lastCommand =
        command.command;







    print("MQTT Message Published");



    print("Robot Received Command");



    print("Executing:");

    print(lastCommand);







    // Robot acknowledgement simulation

    await Future.delayed(

      const Duration(milliseconds:500),

    );





    print("Robot ACK: Command Executed Successfully");



    print("==============================");







    return true;



  }













  Future<RobotConnectionModel>

  getConnectionDetails()

  async {



    await Future.delayed(

      const Duration(milliseconds:500),

    );





    return RobotConnectionModel(



      connected:
      robotConnected,



      protocol:
      protocol,



      ipAddress:
      robotIP,



      signalStrength:
      signalStrength,



      lastCommand:
      lastCommand,



    );



  }













  Future<String>

  getRobotConnectionStatus()

  async {



    await Future.delayed(

      const Duration(milliseconds:500),

    );






    if(robotConnected){


      return "ROBOT ONLINE";


    }


    else{


      return "ROBOT OFFLINE";


    }



  }













  Future<bool>

  emergencyStop()

  async {



    if(!robotConnected){


      return false;


    }







    print("==============================");

    print("EMERGENCY STOP ACTIVATED");

    print("==============================");






    await Future.delayed(

      const Duration(seconds:1),

    );






    lastCommand =
    "EMERGENCY_STOP";






    print("Robot Stopped Successfully");





    return true;



  }













  void disconnectRobot(){



    robotConnected = false;



    signalStrength =
    "No Signal";



    print("Robot Disconnected");



  }













  void reconnectRobot(){



    robotConnected = true;



    signalStrength =
    "Strong";



    print("Robot Connected");



  }








}