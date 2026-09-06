class RobotSensorModel {

  final double temperature;

  final double humidity;

  final String smokeLevel;

  final double gasLevel;

  final String gasStatus;

  final double batteryPercentage;

  final double latitude;

  final double longitude;

  final double distance;


  RobotSensorModel({

    required this.temperature,

    required this.humidity,

    required this.smokeLevel,

    required this.gasLevel,

    required this.gasStatus,

    required this.batteryPercentage,

    required this.latitude,

    required this.longitude,

    required this.distance,

  });


}