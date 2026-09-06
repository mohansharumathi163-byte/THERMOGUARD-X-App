class RobotConnectionModel {


  final bool connected;

  final String protocol;

  final String ipAddress;

  final String signalStrength;

  final String lastCommand;



  RobotConnectionModel({

    required this.connected,

    required this.protocol,

    required this.ipAddress,

    required this.signalStrength,

    required this.lastCommand,

  });


}