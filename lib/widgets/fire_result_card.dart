import 'package:flutter/material.dart';


class FireResultCard extends StatelessWidget {


  final Map<String,dynamic> result;


  const FireResultCard({
    super.key,
    required this.result,
  });



  @override
  Widget build(BuildContext context){


    return Card(

      color: Colors.red.shade900,


      child: Padding(

        padding:
        const EdgeInsets.all(16),


        child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,


            children:[


              Text(
                "🔥 FIRE AI RESULT",
                style:
                TextStyle(
                    color:Colors.white,
                    fontSize:18,
                    fontWeight:FontWeight.bold
                ),
              ),



              Text(
                "Status: ${result["fireDetected"]}",
                style:
                TextStyle(color:Colors.white),
              ),



              Text(
                "Type: ${result["fireType"]}",
                style:
                TextStyle(color:Colors.white),
              ),



              Text(
                "Confidence: ${result["confidence"]}%",
                style:
                TextStyle(color:Colors.white),
              ),



              Text(
                "Temperature: ${result["temperature"]}°C",
                style:
                TextStyle(color:Colors.white),
              ),



              Text(
                "Location: ${result["location"]}",
                style:
                TextStyle(color:Colors.white),
              ),



            ]


        ),

      ),

    );


  }


}