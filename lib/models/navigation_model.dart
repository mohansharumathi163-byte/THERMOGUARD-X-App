class NavigationModel {

  // Building Information
  final String buildingName;
  final String floorNumber;


  // Robot Location
  final String robotPosition;
  final String robotHeading;


  // Target Information
  final String survivorPosition;
  final String firePosition;


  // Route Information
  final List<String> safeRoute;
  final double distanceToTarget;
  final String estimatedArrivalTime;


  // Navigation Status
  final String navigationStatus;
  final String movementStatus;


  // Sensor Information
  final String mappingSource;
  final double locationAccuracy;



  NavigationModel({

    required this.buildingName,

    required this.floorNumber,


    required this.robotPosition,

    required this.robotHeading,


    required this.survivorPosition,

    required this.firePosition,


    required this.safeRoute,

    required this.distanceToTarget,

    required this.estimatedArrivalTime,


    required this.navigationStatus,

    required this.movementStatus,


    required this.mappingSource,

    required this.locationAccuracy,

  });


}