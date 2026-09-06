class SurvivorDetectionStatusModel {


  final bool humanDetected;

  final double confidence;

  final String detectionMethod;

  final String status;



  SurvivorDetectionStatusModel({

    required this.humanDetected,

    required this.confidence,

    required this.detectionMethod,

    required this.status,

  });


}