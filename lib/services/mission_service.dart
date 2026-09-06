import '../models/mission_model.dart';


class MissionService {


  Future<MissionModel> getMissionStatus() async {


    await Future.delayed(
        const Duration(seconds:1)
    );



    return MissionModel(

      missionId:
      "TGX-001",


      missionStatus:
      "ACTIVE RESCUE MISSION",


      robotStatus:
      "ONLINE",


      battery:
      86,


      currentFloor:
      "Floor 5",


      robotLocation:
      "Room 501",


      targetLocation:
      "Room 505",


      fireStatus:
      "Electrical Fire Detected",


      survivorStatus:
      "Survivor Waiting For Rescue",


    );


  }



}