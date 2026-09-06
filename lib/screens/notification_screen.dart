import 'package:flutter/material.dart';

import '../models/notification_model.dart';
import '../widgets/notification_card.dart';



class NotificationScreen extends StatelessWidget {

  const NotificationScreen({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    final List<NotificationModel> notifications = [


      NotificationModel(

        title: "Fire Detected",

        message:
        "High temperature detected near Floor 3",

        priority: "HIGH",

        type: "Fire Alert",

        time: "10:45 AM",

      ),



      NotificationModel(

        title: "Survivor Found",

        message:
        "Possible survivor detected using thermal camera",

        priority: "HIGH",

        type: "Survivor Alert",

        time: "10:47 AM",

      ),



      NotificationModel(

        title: "Battery Warning",

        message:
        "Robot battery level below 20%",

        priority: "MEDIUM",

        type: "Battery Alert",

        time: "10:50 AM",

      ),



      NotificationModel(

        title: "Sensor Check",

        message:
        "All sensors working normally",

        priority: "LOW",

        type: "System Warning",

        time: "10:52 AM",

      ),


    ];



    return Scaffold(


      backgroundColor: Colors.black87,


      appBar: AppBar(


        backgroundColor: Colors.red.shade900,


        title: const Text(

          "RESCUE ALERTS",

        ),


      ),



      body: ListView.builder(


        padding: const EdgeInsets.all(16),


        itemCount: notifications.length,


        itemBuilder: (context,index){


          return Padding(


            padding:
            const EdgeInsets.only(bottom:12),



            child: NotificationCard(


              notification:
              notifications[index],


            ),


          );


        },


      ),


    );


  }

}