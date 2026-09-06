import '../models/survivor_tracking_model.dart';



class SurvivorTrackingService {



  Future<SurvivorTrackingModel> getTrackingData() async {



    await Future.delayed(

      const Duration(seconds:2),

    );




    return SurvivorTrackingModel(



      survivorId:

      "S001",



      distance:

      8.5,



      direction:

      "North East",



      robotLocation:

      "Floor 5 - Room 501",



      survivorLocation:

      "Floor 5 - Room 505",




      trackingStatus:

      "TARGET LOCKED",




      trackingAccuracy:

      97.5,




      movementStatus:

      "Weak Movement Detected",




      sensorSource:

      "LiDAR + Thermal Camera + UWB",




      signalStatus:

      "Strong Connection",




      rescuePriority:

      "CRITICAL",




      estimatedRescueTime:

      "3 Minutes",


    );


  }



}