import 'package:flutter/material.dart';


class ThermalSurvivorCard extends StatelessWidget {


  const ThermalSurvivorCard({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    return Card(


      color: Colors.grey.shade900,


      child: Padding(


        padding:
        const EdgeInsets.all(16),



        child: Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,



          children: [



            const Text(

              "🌡 THERMAL CAMERA ANALYSIS",

              style: TextStyle(

                color: Colors.orange,

                fontSize:18,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height:15),




            Container(

              height:180,

              width:double.infinity,


              decoration: BoxDecoration(

                color: Colors.black,

                borderRadius:
                BorderRadius.circular(12),


                border: Border.all(

                  color: Colors.red,

                  width:2,

                ),

              ),



              child: const Center(

                child: Icon(

                  Icons.thermal,

                  size:70,

                  color: Colors.red,

                ),

              ),


            ),





            const SizedBox(height:15),




            const Text(

              "Heat Signature : HUMAN DETECTED",

              style: TextStyle(

                color: Colors.white,

              ),

            ),





            const Text(

              "AI Tracking : LOCKED",

              style: TextStyle(

                color: Colors.green,

              ),

            ),




          ],


        ),


      ),


    );


  }


}