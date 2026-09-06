import 'package:flutter/material.dart';

// Widgets
import '../widgets/status_card.dart';
import '../widgets/camera_preview_card.dart';
import '../widgets/sensor_status_card.dart';
import '../widgets/mission_card.dart';
import '../widgets/robot_status_card.dart';

// Models
import '../models/robot_sensor_model.dart';
import '../models/robot_status_model.dart';

// Services
import '../services/robot_sensor_service.dart';
import '../services/robot_status_service.dart';
import '../services/safety_alert_service.dart';

// Screens
import 'survivor_screen.dart';
import 'live_camera_screen.dart';
import 'communication_screen.dart';
import 'notification_screen.dart';
import 'navigation_screen.dart';
import 'fire_control_screen.dart';
import 'robot_communication_screen.dart';



class DashboardScreen extends StatefulWidget {

  const DashboardScreen({
    super.key,
  });


  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();

}





class _DashboardScreenState
    extends State<DashboardScreen> {



final RobotStatusService statusService =
RobotStatusService();



final RobotSensorService sensorService =
RobotSensorService();



final SafetyAlertService safetyService =
SafetyAlertService();




RobotStatusModel? robotStatus;


RobotSensorModel? sensorData;



bool loading = true;





@override
void initState() {

super.initState();

loadDashboardData();

}





Future<void> loadDashboardData() async {


try {


setState(() {

loading = true;

});



final status =
await statusService.getRobotStatus();



final sensor =
await sensorService.getSensorData();




if(mounted){


setState(() {


robotStatus = status;


sensorData = sensor;


loading = false;


});


}



}


catch(error){


debugPrint(
"Dashboard Error : $error"
);



if(mounted){


setState(() {


loading = false;


});


}


}


}






@override
Widget build(BuildContext context) {


return Scaffold(


appBar: AppBar(


backgroundColor:
Colors.red.shade900,


title:
const Text(

"THERMOGUARD-X COMMAND CENTER",

),



actions: [


IconButton(

icon:
const Icon(
Icons.refresh
),


onPressed:
loadDashboardData,


)


],


),






body:


loading



?



const Center(


child:

CircularProgressIndicator(),


)



:



SingleChildScrollView(


padding:

const EdgeInsets.all(16),




child:

Column(



crossAxisAlignment:

CrossAxisAlignment.start,



children: [



_infoCard(),




const SizedBox(height:20),





sectionTitle(
"ROBOT STATUS"
),





StatusCard(


icon:
Icons.smart_toy,


title:
"Robot Connection",


value:
"ONLINE",


iconColor:
Colors.green,


),





StatusCard(


icon:
Icons.battery_full,


title:
"Battery Level",


value:

"${sensorData!.batteryPercentage}%",


iconColor:
Colors.blue,


),





StatusCard(


icon:
Icons.local_fire_department,


title:
"Mission Status",


value:

robotStatus?.missionStatus ??

"Searching...",


iconColor:
Colors.red,


),




const SizedBox(height:25),





sectionTitle(
"SAFETY MONITORING"
),





_safetyCard(),




const SizedBox(height:25),





sectionTitle(
"ROBOT LIVE STATUS"
),




if(robotStatus != null)

RobotStatusCard(

status:
robotStatus!,


),




const SizedBox(height:25),





sectionTitle(
"LIVE MONITORING"
),





const CameraPreviewCard(


cameraType:

"RGB + Thermal Camera",


status:

"ACTIVE",


resolution:

"1920 x 1080",


),




const SizedBox(height:15),





SensorStatusCard(


temperature:

"${sensorData!.temperature} °C",



humidity:

"${sensorData!.humidity}%",



smokeLevel:

sensorData!.smokeLevel,



gasLevel:

"${sensorData!.gasLevel}",



signalStrength:

"Strong",


),


  const SizedBox(height:15),




  const MissionCard(


    mission:

    "Search & Rescue",



    target:

    "Survivor Detected",



    location:

    "Floor 5 - Room 505",



    status:

    "Robot Moving",



  ),






  const SizedBox(height:25),





  sectionTitle(
      "RESCUE MODULES"
  ),






  moduleCard(

    context,

    Icons.person_search,

    "Survivor Detection",

    "AI Human Detection System",

    const SurvivorScreen(),

  ),






  moduleCard(

    context,

    Icons.camera_alt,

    "Live Camera",

    "RGB + Thermal Monitoring",

    const LiveCameraScreen(),

  ),






  moduleCard(

    context,

    Icons.record_voice_over,

    "Communication",

    "Two Way Voice Communication",

    const CommunicationScreen(),

  ),






  moduleCard(

    context,

    Icons.wifi,

    "Robot Communication",

    "Robot Connection Status",

    RobotCommunicationScreen(),

  ),






  moduleCard(

    context,

    Icons.warning,

    "Emergency Alerts",

    "Fire and Survivor Notifications",

    const NotificationScreen(),

  ),






  moduleCard(

    context,

    Icons.map,

    "Indoor Navigation",

    "AI Path Planning",

    const NavigationScreen(),

  ),






  moduleCard(

    context,

    Icons.local_fire_department,

    "Fire Control",

    "AI Fire Detection",

    const FireControlScreen(),

  ),






  const SizedBox(height:25),






  sectionTitle(
      "SYSTEM HEALTH"
  ),





  StatusCard(

    icon:
    Icons.thermostat,


    title:
    "Robot Temperature",


    value:

    "${sensorData!.temperature} °C",


    iconColor:
    Colors.orange,


  ),





  StatusCard(

    icon:
    Icons.sensors,


    title:
    "Safety Status",


    value:

    safetyService
        .checkSafetyStatus(sensorData!),


    iconColor:

    safetyService
        .isEmergency(sensorData!)

        ?

    Colors.red

        :

    Colors.green,


  ),




],


),


),


);


}








Widget _safetyCard(){



  final status =
  safetyService
      .checkSafetyStatus(sensorData!);



  final priority =
  safetyService
      .getAlertPriority(sensorData!);





  bool emergency =
  safetyService
      .isEmergency(sensorData!);





  return Card(



    color:

    emergency

        ?

    Colors.red.shade900

        :

    Colors.grey.shade900,





    elevation:8,



    child:

    Padding(



      padding:

      const EdgeInsets.all(16),





      child:

      Column(



        crossAxisAlignment:

        CrossAxisAlignment.start,





        children: [





          Row(



            children: [



              Icon(


                emergency

                    ?

                Icons.warning

                    :

                Icons.check_circle,



                color:

                emergency

                    ?

                Colors.yellow

                    :

                Colors.green,


              ),





              const SizedBox(width:10),





              const Text(


                "ROBOT SAFETY ALERT",



                style:

                TextStyle(



                  color:

                  Colors.white,



                  fontSize:18,



                  fontWeight:

                  FontWeight.bold,


                ),


              ),




            ],



          ),





          const SizedBox(height:15),






          Text(



            "Status : $status",



            style:

            const TextStyle(



              color:

              Colors.white,



              fontSize:16,


            ),



          ),






          const SizedBox(height:8),






          Text(



            "Priority : $priority",



            style:

            const TextStyle(



              color:

              Colors.orange,



              fontWeight:

              FontWeight.bold,


            ),



          ),





          const SizedBox(height:8),






          Text(



            safetyService
                .generateAlertMessage(sensorData!),



            style:

            const TextStyle(



              color:

              Colors.white70,



            ),



          ),





        ],



      ),



    ),



  );



}









Widget _infoCard(){


  return Card(


    color:

    Colors.grey.shade900,



    child:

    const Padding(


      padding:

      EdgeInsets.all(16),



      child:

      Column(


        crossAxisAlignment:

        CrossAxisAlignment.start,



        children: [



          Text(

            "AI FIRE RESCUE ROBOT",

            style:

            TextStyle(

              color:

              Colors.orange,

              fontSize:

              22,

              fontWeight:

              FontWeight.bold,

            ),

          ),





          SizedBox(height:8),





          Text(

            "Autonomous Fire Detection | Survivor Rescue | Emergency Response",

            style:

            TextStyle(

              color:

              Colors.white70,

            ),

          ),



        ],


      ),


    ),


  );


}









Widget sectionTitle(String title){


  return Padding(


    padding:

    const EdgeInsets.only(bottom:10),



    child:

    Text(


      title,



      style:

      Theme.of(context)

          .textTheme

          .titleLarge,



    ),



  );


}









Widget moduleCard(

    BuildContext context,

    IconData icon,

    String title,

    String subtitle,

    Widget page,

    ){



  return Card(


    child:

    ListTile(



      leading:

      CircleAvatar(



        backgroundColor:

        Colors.red.shade900,




        child:

        Icon(

          icon,

          color:

          Colors.white,

        ),


      ),





      title:

      Text(title),





      subtitle:

      Text(subtitle),






      trailing:

      const Icon(

        Icons.arrow_forward_ios,

        size:

        18,

      ),





      onTap:(){



        Navigator.push(



          context,



          MaterialPageRoute(



            builder:

                (context)=>page,



          ),



        );




      },



    ),



  );


}




}