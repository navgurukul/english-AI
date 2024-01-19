
// import 'package:englishetc_voice_ai/constWidget/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constWidget/textwidget.dart';
import '../mainscreens/desktop.dart';
import '../mainscreens/mobile.dart';
import '../mainscreens/tablet.dart';
import '../responsive/responsive_layout.dart';
// import 'package:englishetc_voice_ai/mainscreens/desktop.dart';
// import 'package:englishetc_voice_ai/mainscreens/mobile.dart';
// import 'package:englishetc_voice_ai/mainscreens/tablet.dart';
// import 'package:englishetc_voice_ai/responsive/responsive_layout.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {

  var  googleSignInAccount;

  GoogleLogIn() async{
    GoogleSignIn _googlesignin= await GoogleSignIn(clientId:
        "547858986996-uar600blj54or1p62g96tgjlbmtjebk9.apps.googleusercontent.com"
        // "1053172784472-vr118jght00dlj7k337h8ehh52qk6si1.apps.googleusercontent.com"
        // "857706222236-j5f1pjpfl237794pbucgt1b5d7fr8uv2.apps.googleusercontent.com"

    );

    // this is....
    try{
      var result= await _googlesignin.signIn();
      googleSignInAccount = result;
      if (result != null){
        print("Signed in as: ${result}");
        print("Signed in as: ${result.displayName}");
        print("image link: ${result.photoUrl}");
        print("Email-id: ${result.email}");
        print("Authentication id: ${result.serverAuthCode}");
        print("${result.id}");

        print("mydata $googleSignInAccount");
        print("google signin methood successful access");
       
        // setuserData();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Login'),),);
         Navigator.push(context, MaterialPageRoute(builder: ((context) => 
         Responsive_layout(
            mobileScaffold: MobilePage(title: 'mobilepage',userdata:googleSignInAccount),
            tabletScaffold: tabletPage(title: 'tabletpage',userdata:googleSignInAccount),
            desktopScaffold: DesktopPage(title: 'desktoppage',userdata:googleSignInAccount)))));
       }
       else{
        print("Signin-canceled");
       }
      
    }catch (error){
      print(error);
    }

  }

  // }
  @override
  Widget build(BuildContext context) {
    var mq= MediaQuery.of(context).size;
    return Scaffold(

      body: Stack (
          children:[
            Container(
              height:mq.height,
              width:mq.width,
              child:Image.asset("images/greenbg.png.jpg",fit:BoxFit.fill,
            )),
            Center(
                child:Container(
                  height:380,
                  width:380,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Center(child:Image.asset("images/new.png",height:90,width:90)),
                        Center(child:textwidget("English AI",30, FontWeight.bold, Colors.green)),
                        SizedBox(height:20),
      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textwidget("Welcome to Learning with",18, FontWeight.w500,Colors.black),
                            SizedBox(width:5),
                            textwidget("English AI",18, FontWeight.bold,Colors.black),
                        ],
                        ),
      
                        SizedBox(height:40),
                        Center(child: textwidget("Continue with English AI",20, FontWeight.w600,Colors.black)),
      
                        SizedBox(height:40),
                        Center(
                          child:Container(
                              width:200,
                              // color: Color(0xFFF016A70),
                              child: ElevatedButton(onPressed: (){GoogleLogIn();},
                                  style:ElevatedButton.styleFrom(backgroundColor:Color(0xFFF64CCC5) ) ,
                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        Image.asset("images/google.png",height:16,width:21),
                                        SizedBox(width:15),
                                        textwidget("Login with Google",13, FontWeight.bold,Colors.white)
                                      ])
                              ),
                            ),
                          ),
      
                          // SizedBox(height:10),
                          //
                          // Center(
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       GoogleSignOut();},
                          //     child: Text("Sign Out"),
                          //   ),
                          // )
      
                      
      
                      ]
                    ),
                  ),
                ))
          ]
        ),

    );
  }
}






