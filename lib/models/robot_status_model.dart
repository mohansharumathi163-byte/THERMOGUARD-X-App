class RobotStatusModel {


  // Power Status
  final int battery;


  // Environmental Sensors
  final double temperature;
  final double humidity;
  final String smokeLevel;
  final double gasLevel;


  // Robot Movement Status
  final String motorStatus;
  final String movementStatus;


  // Mission Information
  final String missionStatus;


  // Sensor Health
  final String sensorStatus;


  // Communication
  final String signalStrength;
  final String connectionStatus;


  // Location
  final double latitude;
  final double longitude;



  RobotStatusModel({

    required this.battery,


    required this.temperature,

    required this.humidity,

    required this.smokeLevel,

    required this.gasLevel,


    required this.motorStatus,

    required this.movementStatus,


    required this.missionStatus,


    required this.sensorStatus,


    required this.signalStrength,

    required this.connectionStatus,


    required this.latitude,

    required this.longitude,

  });


}