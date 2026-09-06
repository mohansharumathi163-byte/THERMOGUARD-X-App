import 'package:flutter/material.dart';


class PushToTalkButton extends StatefulWidget {

  const PushToTalkButton({
    super.key,
  });


  @override
  State<PushToTalkButton> createState() =>
      _PushToTalkButtonState();

}



class _PushToTalkButtonState
    extends State<PushToTalkButton> {


  bool isTalking = false;



  @override
  Widget build(BuildContext context) {


    return GestureDetector(


      onLongPressStart: (_) {


        setState(() {

          isTalking = true;

        });


      },


      onLongPressEnd: (_) {


        setState(() {

          isTalking = false;

        });


      },



      child: Container(


        height:150,

        width:150,



        decoration: BoxDecoration(


          shape: BoxShape.circle,


          color: isTalking

              ? Colors.red

              : Colors.blue.shade800,


          boxShadow: [


            BoxShadow(

              color: Colors.black45,

              blurRadius:10,

              spreadRadius:3,

            )


          ],


        ),



        child: Column(


          mainAxisAlignment:
          MainAxisAlignment.center,


          children: [



            Icon(

              isTalking

                  ? Icons.mic

                  : Icons.mic_none,


              size:50,

              color:Colors.white,

            ),



            const SizedBox(height:10),



            Text(

              isTalking

                  ? "TALKING"

                  : "PRESS & HOLD",


              style: const TextStyle(


                color:Colors.white,


                fontWeight:
                FontWeight.bold,


              ),

            ),



          ],


        ),


      ),

    );


  }

}