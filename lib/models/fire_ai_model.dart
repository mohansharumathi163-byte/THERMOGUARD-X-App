class FireAIModel {


  final String detectedFireType;

  final String recommendedAgent;

  final double confidence;

  final String safetyWarning;

  final String reason;

  final String aiStatus;



  FireAIModel({


    required this.detectedFireType,


    required this.recommendedAgent,


    required this.confidence,


    required this.safetyWarning,


    required this.reason,


    required this.aiStatus,


  });


}