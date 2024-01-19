// import "package:englishetc_voice_ai/mainscreens/aap_bar.dart";
import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";

import "../mainscreens/aap_bar.dart";

class profile extends StatefulWidget {

  GoogleSignInAccount? userData;
  profile({required this.userData});


  @override
  State<profile> createState() => _profileState();
}


class _profileState extends State<profile> {


  // var  googleSignInAccount;


  @override
  Widget build(BuildContext context) {
    var mq= MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appbar(
          Paragraph: null,
          userData: widget.userData,
          appbaricon: Icons.person,
          appbarsize: 16,image_height: 20,image_width: 30,textfont: 18,popupmenu:15, cleanedWord: null, notAvailable: '', score: null,
        ),
        body:
        Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(child: Image.asset("images/user.png"),radius: 30,),
              SizedBox(height:20),
              Text(widget.userData?.displayName ?? "No Display Name" ,style: TextStyle(fontWeight:FontWeight.bold,fontSize:20,),),
              SizedBox(height:20),
              Text(widget.userData?.email ?? "no email",style: TextStyle(fontSize:20,),),
              SizedBox(height:20),
              // Text(widget.userData?.id ?? "No Display Name",style: TextStyle(fontWeight:FontWeight.bold,fontSize:20,),),
            ],
          )
        )

      ),
    );}}