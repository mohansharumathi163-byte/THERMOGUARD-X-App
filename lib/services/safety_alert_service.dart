import '../models/robot_sensor_model.dart';


class SafetyAlertService {



  // Check complete robot safety status

  String checkSafetyStatus(
      RobotSensorModel sensor
      ){


    // Temperature Safety

    if(sensor.temperature >= 900){

      return "🚨 CRITICAL HEAT ALERT";

    }



    // Toxic Gas Detection

    else if(sensor.gasLevel >= 200){

      return "☢️ TOXIC GAS DETECTED";

    }




    // Smoke Detection

    else if(sensor.smokeLevel.toUpperCase() == "HIGH"){

      return "🔥 HIGH SMOKE LEVEL";

    }





    // Battery Warning

    else if(sensor.batteryPercentage <= 20){

      return "🔋 LOW BATTERY WARNING";

    }




    else{

      return "✅ SYSTEM NORMAL";

    }


  }







  // Return alert priority level


  String getAlertPriority(
      RobotSensorModel sensor
      ){



    if(sensor.temperature >= 900 ||

        sensor.gasLevel >= 200){


      return "CRITICAL";


    }



    else if(sensor.smokeLevel.toUpperCase()=="HIGH"){


      return "WARNING";


    }



    else if(sensor.batteryPercentage <=20){


      return "LOW";


    }



    else{


      return "NORMAL";


    }



  }








  // Generate readable emergency message


  String generateAlertMessage(
      RobotSensorModel sensor
      ){



    return """

THERMOGUARD-X SAFETY ALERT

Temperature:
${sensor.temperature} °C


Smoke Level:
${sensor.smokeLevel}


Gas Level:
${sensor.gasLevel}


Battery:
${sensor.batteryPercentage}%


Status:
${checkSafetyStatus(sensor)}


Priority:
${getAlertPriority(sensor)}


""";



  }






  // Check whether emergency action is required


  bool isEmergency(
      RobotSensorModel sensor
      ){



    return sensor.temperature >= 900 ||

        sensor.gasLevel >=200 ||

        sensor.smokeLevel.toUpperCase()=="HIGH";


  }



}