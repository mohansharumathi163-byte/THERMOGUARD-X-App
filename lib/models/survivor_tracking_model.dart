class SurvivorTrackingModel {

  final String survivorId;

  // Distance & Navigation
  final double distance;
  final String direction;

  final String robotLocation;
  final String survivorLocation;


  // Tracking Information
  final String trackingStatus;
  final double trackingAccuracy;
  final String movementStatus;


  // Sensor Information
  final String sensorSource;
  final String signalStatus;


  // Rescue Information
  final String rescuePriority;
  final String estimatedRescueTime;



  SurvivorTrackingModel({

    required this.survivorId,


    required this.distance,

    required this.direction,


    required this.robotLocation,

    required this.survivorLocation,


    required this.trackingStatus,

    required this.trackingAccuracy,

    required this.movementStatus,


    required this.sensorSource,

    required this.signalStatus,


    required this.rescuePriority,

    required this.estimatedRescueTime,

  });

}