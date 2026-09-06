class MissionControlModel {

  final String missionName;

  final String missionStatus;

  final String objective;

  final int progress;

  final bool robotActive;


  MissionControlModel({

    required this.missionName,

    required this.missionStatus,

    required this.objective,

    required this.progress,

    required this.robotActive,

  });

}