import 'package:flutter/material.dart';

import '../models/communication_model.dart';
import '../services/communication_service.dart';

import '../widgets/push_to_talk_button.dart';
import '../widgets/voice_status_card.dart';



class CommunicationScreen extends StatefulWidget {


  const CommunicationScreen({

    super.key,

  });



  @override
  State<CommunicationScreen> createState() =>
      _CommunicationScreenState();


}







class _CommunicationScreenState
    extends State<CommunicationScreen> {



  final CommunicationService communicationService =
  CommunicationService();




  CommunicationModel? communication;



  final TextEditingController messageController =
  TextEditingController();







  @override
  void initState() {

    super.initState();

    loadCommunication();

  }









  Future<void> loadCommunication() async {



    final result =

    await communicationService
        .getCommunicationStatus();




    if(mounted){


      setState((){

        communication = result;


      });


    }


  }









  Future<void> sendMessage(String message) async {



    final result =

    await communicationService
        .sendMessage(message);





    if(mounted){



      ScaffoldMessenger.of(context)
          .showSnackBar(



        SnackBar(



          content:

          Text(

            result

                ?

            "Message Sent Successfully"

                :

            "Robot Connection Failed",

          ),



        ),



      );



    }



  }









  @override
  Widget build(BuildContext context) {



    return Scaffold(



      backgroundColor:
      Colors.black87,




      appBar: AppBar(



        backgroundColor:
        Colors.red.shade900,



        title:
        const Text(

          "RESCUE COMMUNICATION",

        ),



      ),








      body:

      communication == null



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



          children: [







            VoiceStatusCard(



              communication:
              communication!,



            ),







            const SizedBox(height:30),








            const Text(



              "TWO-WAY VOICE COMMUNICATION",



              style:

              TextStyle(



                color:
                Colors.orange,


                fontSize:18,


                fontWeight:
                FontWeight.bold,


              ),



            ),









            const SizedBox(height:20),







            const PushToTalkButton(),









            const SizedBox(height:30),







            Card(



              color:
              Colors.grey.shade900,




              child:

              Padding(



                padding:
                const EdgeInsets.all(16),





                child:

                Column(



                  crossAxisAlignment:
                  CrossAxisAlignment.start,





                  children: [






                    const Text(



                      "SEND MESSAGE TO ROBOT",




                      style:

                      TextStyle(



                        color:
                        Colors.orange,


                        fontSize:18,


                        fontWeight:
                        FontWeight.bold,


                      ),



                    ),









                    const SizedBox(height:15),







                    TextField(



                      controller:
                      messageController,




                      style:
                      const TextStyle(

                        color: Colors.white,

                      ),




                      decoration:

                      const InputDecoration(



                        hintText:
                        "Enter emergency message",



                        hintStyle:
                        TextStyle(

                          color: Colors.white54,

                        ),




                        enabledBorder:

                        OutlineInputBorder(),



                      ),



                    ),









                    const SizedBox(height:15),









                    SizedBox(



                      width:
                      double.infinity,




                      child:

                      ElevatedButton(



                        onPressed: (){



                          if(messageController
                              .text
                              .isNotEmpty){



                            sendMessage(

                              messageController.text,

                            );


                            messageController.clear();



                          }



                        },




                        child:

                        const Text(

                          "SEND TO ROBOT",

                        ),




                      ),




                    ),







                    const SizedBox(height:20),









                    const Text(



                      "QUICK EMERGENCY MESSAGES",




                      style:

                      TextStyle(



                        color:
                        Colors.orange,


                        fontSize:18,


                        fontWeight:
                        FontWeight.bold,


                      ),



                    ),







                    const SizedBox(height:15),








                    _messageButton(

                      "Stay Calm, Rescue Team Coming",

                    ),







                    _messageButton(

                      "Move Towards Robot",

                    ),








                    _messageButton(

                      "Emergency Help Required",

                    ),







                  ],



                ),



              ),



            ),





          ],



        ),



      ),



    );


  }









  Widget _messageButton(String message){



    return Container(



      width:
      double.infinity,



      margin:

      const EdgeInsets.only(

        bottom:10,

      ),





      child:

      ElevatedButton(



        onPressed: (){



          sendMessage(message);



        },





        child:

        Text(message),





      ),




    );



  }









  @override
  void dispose(){


    messageController.dispose();


    super.dispose();


  }



}