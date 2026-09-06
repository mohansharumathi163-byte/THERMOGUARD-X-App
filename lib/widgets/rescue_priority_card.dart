import 'package:flutter/material.dart';



class RescuePriorityCard extends StatelessWidget {


  final String priorityLevel;

  final String reason;

  final String survivorCondition;

  final String recommendedAction;



  const RescuePriorityCard({


    super.key,


    required this.priorityLevel,


    required this.reason,


    required this.survivorCondition,


    required this.recommendedAction,


  });



  @override
  Widget build(BuildContext context) {


    return Card(


      child: Padding(


        padding: const EdgeInsets.all(16),



        child: Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,



          children: [



            Row(


              children: [



                const Icon(

                  Icons.priority_high,

                  color: Colors.red,

                  size:30,

                ),




                const SizedBox(width:10),




                Text(


                  "RESCUE PRIORITY",


                  style: Theme.of(context)
                      .textTheme
                      .titleLarge,


                ),


              ],


            ),





            const SizedBox(height:15),





            _priorityRow(

              "Priority Level",

              priorityLevel,

              Colors.red,

            ),





            _priorityRow(

              "Reason",

              reason,

              Colors.orange,

            ),





            _priorityRow(

              "Survivor Condition",

              survivorCondition,

              Colors.blue,

            ),





            _priorityRow(

              "Recommended Action",

              recommendedAction,

              Colors.green,

            ),




          ],


        ),


      ),


    );


  }





  Widget _priorityRow(

      String title,

      String value,

      Color color,

      ) {


    return Padding(


      padding:
      const EdgeInsets.symmetric(

        vertical:8,

      ),



      child: Row(


        crossAxisAlignment:
        CrossAxisAlignment.start,



        children: [



          Expanded(


            child: Text(

              title,

            ),

          ),





          Flexible(


            child: Text(


              value,


              textAlign:
              TextAlign.right,


              style: TextStyle(

                color: color,

                fontWeight:
                FontWeight.bold,

              ),


            ),


          ),



        ],


      ),


    );


  }


}