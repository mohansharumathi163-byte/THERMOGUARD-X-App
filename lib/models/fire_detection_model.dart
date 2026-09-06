class FireDetectionModel {

  final bool fireDetected;

  final String fireType;

  final double temperature;

  final double confidence;

  final String severity;


  FireDetectionModel({

    required this.fireDetected,

    required this.fireType,

    required this.temperature,

    required this.confidence,

    required this.severity,

  });

}