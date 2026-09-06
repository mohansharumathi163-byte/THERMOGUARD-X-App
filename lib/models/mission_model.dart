class MissionModel {

  final String missionId;

  final String missionStatus;

  final String robotStatus;

  final int battery;

  final String currentFloor;

  final String robotLocation;

  final String targetLocation;

  final String fireStatus;

  final String survivorStatus;


  MissionModel({

    required this.missionId,

    required this.missionStatus,

    required this.robotStatus,

    required this.battery,

    required this.currentFloor,

    required this.robotLocation,

    required this.targetLocation,

    required this.fireStatus,

    required this.survivorStatus,

  });

}