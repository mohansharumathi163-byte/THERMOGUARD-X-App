import 'package:flutter/material.dart';

import '../models/notification_model.dart';


class NotificationCard extends StatelessWidget {


  final NotificationModel notification;



  const NotificationCard({

    super.key,

    required this.notification,

  });





  Color getPriorityColor(){


    switch(notification.priority){


      case "CRITICAL":

        return Colors.redAccent;


      case "HIGH":

        return Colors.red;


      case "MEDIUM":

        return Colors.orange;


      case "LOW":

      case "NORMAL":

        return Colors.green;


      default:

        return Colors.grey;


    }


  }







  IconData getAlertIcon(){


    switch(notification.type){


      case "FIRE":

      case "Fire Alert":

        return Icons.local_fire_department;



      case "SURVIVOR":

      case "Survivor Alert":

        return Icons.person_search;



      case "BATTERY":

      case "Battery Alert":

        return Icons.battery_alert;



      case "COMMUNICATION":

        return Icons.record_voice_over;



      case "SYSTEM":

      case "System Warning":

        return Icons.settings;



      default:

        return Icons.warning;



    }


  }







  @override
  Widget build(BuildContext context){



    return Card(


      color:
      Colors.grey.shade900,


      elevation:
      8,



      shape:
      RoundedRectangleBorder(


        borderRadius:
        BorderRadius.circular(15),


      ),





      child:
      Padding(


        padding:
        const EdgeInsets.all(15),




        child:
        Row(


          children: [





            CircleAvatar(


              radius:
              28,



              backgroundColor:
              getPriorityColor(),





              child:
              Icon(


                getAlertIcon(),


                color:
                Colors.white,


                size:
                30,


              ),



            ),





            const SizedBox(width:15),







            Expanded(


              child:
              Column(



                crossAxisAlignment:
                CrossAxisAlignment.start,



                children: [





                  Text(


                    notification.title,



                    style:
                    const TextStyle(



                      color:
                      Colors.white,


                      fontSize:
                      18,


                      fontWeight:
                      FontWeight.bold,


                    ),



                  ),







                  const SizedBox(height:6),





                  Text(


                    notification.message,



                    style:
                    const TextStyle(



                      color:
                      Colors.white70,


                    ),



                  ),








                  const SizedBox(height:8),





                  Row(


                    children: [




                      Text(



                        "Priority: ${notification.priority}",



                        style:
                        TextStyle(



                          color:
                          getPriorityColor(),



                          fontWeight:
                          FontWeight.bold,


                        ),



                      ),





                      const SizedBox(width:20),






                      Text(


                        notification.time,



                        style:
                        const TextStyle(



                          color:
                          Colors.white54,


                        ),



                      ),




                    ],


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