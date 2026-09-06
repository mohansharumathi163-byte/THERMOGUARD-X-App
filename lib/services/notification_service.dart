import '../models/notification_model.dart';



class NotificationService {



  Future<List<NotificationModel>> getNotifications() async {



    await Future.delayed(

      const Duration(seconds:1),

    );




    return [



      NotificationModel(

        title:

        "🔥 FIRE DETECTED",


        message:

        "Critical electrical fire detected at Floor 5 Room 501",


        priority:

        "HIGH",


        type:

        "FIRE",


        time:

        "10:30 AM",

      ),





      NotificationModel(

        title:

        "🧍 SURVIVOR FOUND",


        message:

        "Human heat signature detected. Rescue operation started",


        priority:

        "CRITICAL",


        type:

        "SURVIVOR",


        time:

        "10:32 AM",

      ),





      NotificationModel(

        title:

        "🤖 ROBOT STATUS",


        message:

        "THERMOGUARD-X robot connected successfully",


        priority:

        "NORMAL",


        type:

        "SYSTEM",


        time:

        "10:33 AM",

      ),





      NotificationModel(

        title:

        "📡 COMMUNICATION ACTIVE",


        message:

        "Two-way voice communication channel connected",


        priority:

        "NORMAL",


        type:

        "COMMUNICATION",


        time:

        "10:34 AM",

      ),




    ];



  }



}