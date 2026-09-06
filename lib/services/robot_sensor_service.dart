import '../models/robot_sensor_model.dart';


class RobotSensorService {


  // Get latest robot sensor readings
  // Currently simulated data.
  // Later connect ESP32 / Jetson Nano using REST API, MQTT, or WebSocket.

  Future<RobotSensorModel> getSensorData() async {


    try {


      // Simulate sensor response delay

      await Future.delayed(

        const Duration(seconds: 1),

      );



      double gasValue = 120.5;



      return RobotSensorModel(


        // Temperature Sensor

        temperature:

        78.5,



        // Humidity Sensor

        humidity:

        45.0,



        // Smoke Sensor

        smokeLevel:

        "HIGH",



        // Gas Sensor Value

        gasLevel:

        gasValue,



        // Gas Status

        gasStatus:

        gasValue > 200

            ?

        "DANGER"

            :

        "SAFE",



        // Battery Monitoring

        batteryPercentage:

        82.0,



        // GPS Location

        latitude:

        11.0320,



        longitude:

        77.0150,



        // Distance from survivor/fire target

        distance:

        15.5,


      );


    }


    catch(e){


      throw Exception(

        "Failed to collect robot sensor data: $e",

      );


    }


  }






  // Check complete robot safety condition

  String checkSafetyStatus(

      RobotSensorModel sensor

      ){



    if(sensor.temperature > 900){


      return "CRITICAL TEMPERATURE";


    }


    else if(sensor.gasLevel > 200){


      return "TOXIC GAS DETECTED";


    }


    else if(sensor.smokeLevel == "HIGH"){


      return "SMOKE LEVEL HIGH";


    }


    else if(sensor.batteryPercentage < 20){


      return "LOW BATTERY";


    }


    else{


      return "SYSTEM NORMAL";


    }


  }







  // Convert sensor data into readable report

  String generateSensorReport(

      RobotSensorModel sensor

      ){



    return """

ROBOT SENSOR STATUS


Temperature:
${sensor.temperature} °C


Humidity:
${sensor.humidity}%


Smoke Level:
${sensor.smokeLevel}


Gas Level:
${sensor.gasLevel}


Gas Status:
${sensor.gasStatus}


Battery:
${sensor.batteryPercentage}%


Location:
${sensor.latitude},
${sensor.longitude}


Distance:
${sensor.distance} meters


Safety:
${checkSafetyStatus(sensor)}



""";


  }



}