import 'package:flutter/material.dart';



class StatusCard extends StatelessWidget {


  final IconData icon;

  final String title;

  final String value;

  final Color iconColor;



  const StatusCard({

    super.key,

    required this.icon,

    required this.title,

    required this.value,

    required this.iconColor,

  });



  @override
  Widget build(BuildContext context) {


    return Card(


      child: Padding(


        padding: const EdgeInsets.all(16),



        child: Row(


          children: [



            CircleAvatar(


              radius: 25,


              backgroundColor:
              iconColor.withOpacity(0.2),



              child: Icon(


                icon,


                color: iconColor,


                size: 30,


              ),


            ),





            const SizedBox(width: 15),





            Expanded(


              child: Column(


                crossAxisAlignment:
                CrossAxisAlignment.start,



                children: [



                  Text(


                    title,


                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,


                  ),




                  const SizedBox(height: 5),





                  Text(


                    value,


                    style: Theme.of(context)
                        .textTheme
                        .titleLarge,


                  ),



                ],


              ),


            ),



          ],


        ),


      ),


    );


  }


}