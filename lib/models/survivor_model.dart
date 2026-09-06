class Survivor {


  final String id;


  // AI Detection Information

  final double confidence;

  final String detectionSource;



  // Location

  final String building;

  final String floor;

  final String room;

  final double distance;

  final String direction;



  // Health Information

  final int heartRate;

  final double bodyTemperature;

  final String movementStatus;

  final String voiceStatus;



  // Rescue Information

  final String priority;

  final String rescueStatus;



  // Evidence

  final String imagePath;

  final String detectedTime;




  Survivor({

    required this.id,

    required this.confidence,

    required this.detectionSource,


    required this.building,

    required this.floor,

    required this.room,

    required this.distance,

    required this.direction,


    required this.heartRate,

    required this.bodyTemperature,

    required this.movementStatus,

    required this.voiceStatus,


    required this.priority,

    required this.rescueStatus,


    required this.imagePath,

    required this.detectedTime,

  });







  Map<String,dynamic> toJson(){


    return {


      "id": id,


      "confidence": confidence,


      "detectionSource": detectionSource,


      "building": building,


      "floor": floor,


      "room": room,


      "distance": distance,


      "direction": direction,


      "heartRate": heartRate,


      "bodyTemperature": bodyTemperature,


      "movementStatus": movementStatus,


      "voiceStatus": voiceStatus,


      "priority": priority,


      "rescueStatus": rescueStatus,


      "imagePath": imagePath,


      "detectedTime": detectedTime,


    };


  }



}