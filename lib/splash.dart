



// import 'package:englishetc_voice_ai/Registered_pages/signup.dart';
// import 'package:englishetc_voice_ai/mainscreens/desktop.dart';
// import 'package:englishetc_voice_ai/mainscreens/mobile.dart';
// import 'package:englishetc_voice_ai/mainscreens/tablet.dart';
// import 'package:englishetc_voice_ai/responsive/responsive_layout.dart';
import 'package:etc/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Registered_pages/signup.dart';
import 'mainscreens/desktop.dart';
import 'mainscreens/mobile.dart';
import 'mainscreens/tablet.dart';



class splashScreen extends StatefulWidget {
  splashScreen({super.key});

  static bool login_data=false;

  @override
  State<splashScreen> createState() => _splashScreenState();
}
class _splashScreenState extends State<splashScreen> {

  
  get googleSignInAccount => null;
   @override
   void initState(){
    super.initState();
     Future.delayed(Duration(seconds: 3),(){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>
            SignUp()
            // Responsive_layout(
            //     mobileScaffold: MobilePage(title: 'mobilepage',userdata:googleSignInAccount),
            //     tabletScaffold: tabletPage(title: 'tabletpage',userdata:googleSignInAccount),
            //     desktopScaffold: DesktopPage(title: 'desktoppage',userdata:googleSignInAccount))
            ));});
    // whereToGo();
   }

   whereToGo()async{
    //  SharedPreferences prefs = await SharedPreferences.getInstance();
    //  bool loginData = prefs.getBool('login_data') ?? false; // Read the value from SharedPreferences
    //  splashScreen.login_data = loginData; // Set the value in memory
     print(splashScreen.login_data);
     if (splashScreen.login_data == true) {
        print("condition true");
        Future.delayed(Duration(seconds: 3),(){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>
            Responsive_layout(
                mobileScaffold: MobilePage(title: 'mobilepage',userdata:googleSignInAccount),
                tabletScaffold: tabletPage(title: 'tabletpage',userdata:googleSignInAccount),
                desktopScaffold: DesktopPage(title: 'desktoppage',userdata:googleSignInAccount))));});
      } else{
        print("condition false");
        Future.delayed(Duration(seconds: 3),(){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SignUp()));});
      }
    }
   @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

    // var mq= MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
            child:Image.asset("images/new.png",height:65, width:65)
          ),
    
    
      ),
    );}}