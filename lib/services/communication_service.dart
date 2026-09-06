import '../models/communication_model.dart';


class CommunicationService {


  bool robotConnected = true;


  String lastMessage =
      "No message";



  Future<CommunicationModel>
  getCommunicationStatus() async {


    await Future.delayed(

      const Duration(milliseconds:500),

    );


    return CommunicationModel(

      connected: robotConnected,


      connectionStatus:

      robotConnected

          ? "ROBOT ONLINE"

          : "ROBOT OFFLINE",


      lastMessage:

      lastMessage,


      robotResponse:

      robotConnected

          ? "Ready for Rescue Mission"

          : "Connection Lost",


      communicationMode:

      "Wi-Fi + ESP32 Communication",


    );


  }







  Future<bool> sendMessage(

      String message

      ) async {



    if(!robotConnected){

      return false;

    }



    print("====================");

    print("MESSAGE SENT TO ROBOT");

    print(message);

    print("====================");



    await Future.delayed(

      const Duration(seconds:1),

    );



    lastMessage = message;



    return true;


  }







  Future<String> receiveRobotMessage()

  async {


    await Future.delayed(

      const Duration(seconds:1),

    );



    return

      "Robot Status: Mission Active";


  }





  void disconnect(){

    robotConnected = false;

  }




  void reconnect(){

    robotConnected = true;

  }


}