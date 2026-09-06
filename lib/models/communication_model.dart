class CommunicationModel {


  // New communication fields

  final bool connected;

  final String connectionStatus;

  final String lastMessage;

  final String robotResponse;

  final String communicationMode;



  // Old fields used by widgets

  final bool robotConnected;

  final bool survivorVoiceDetected;

  final String voiceStatus;





  CommunicationModel({


    required this.connected,


    required this.connectionStatus,


    required this.lastMessage,


    required this.robotResponse,


    required this.communicationMode,



    // Optional old fields

    bool? robotConnected,


    bool? survivorVoiceDetected,


    String? voiceStatus,


  })



      :



        robotConnected =

            robotConnected ?? connected,



        survivorVoiceDetected =

            survivorVoiceDetected ?? false,



        voiceStatus =

            voiceStatus ?? "VOICE COMMUNICATION ACTIVE";



}