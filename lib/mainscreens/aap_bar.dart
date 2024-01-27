import 'dart:html';

import 'package:etc/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Registered_pages/profile.dart';
import '../Registered_pages/signup.dart';
import '../const/color.dart';
import 'package:provider/provider.dart';



class appbar extends StatelessWidget implements PreferredSizeWidget {


  final IconData? appbaricon;
  GoogleSignInAccount? userData;
  final double? appbarsize;

  final double? image_height;
  final double? image_width;
  final double textfont;
  final String? Paragraph;
  bool isSpeaking=false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  double popupmenu;
  int? score;
  String? notAvailable;
  int? cleanedWord;


  appbar({required this.cleanedWord,required this.notAvailable,required this.score,required this.Paragraph,required this.appbaricon,required this.userData, required this.appbarsize ,required this.popupmenu,required this.image_width,required this.image_height,required this.textfont, });

  // FlutterTts flutterTts = FlutterTts();
  // Future<void> speakText(String Paragraph) async {
  //   final ttsExample = TtsExample(); // Create an instance of the TtsExample class
  //   await ttsExample.speakText(Paragraph); // Call the speakText function
  // }

  // Future<void> stopSpeaking() async {
  //   await flutterTts.stop(); // Stop TTS
  // }

  // String valueChoose;
  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child){

      
    return Scaffold(
        key:  _scaffoldKey,

        appBar:AppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: unique,
            title: Padding(
              padding: EdgeInsets.all(1),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: image_height,
                          width: image_width,
                          decoration: BoxDecoration(
                            color: unique,
                          ),
                          child: Image.asset(
                            "images/new.png",
                            // fit: BoxFit.cover,
                          ),
                        ),
                        Text("English AI",style: TextStyle(color: menu,fontWeight: FontWeight.bold,fontSize: textfont),),

                      ],
                    ),


                    // GestureDetector(
                    //   onTap: () {
                    //     if (isSpeaking) {
                    //       stopSpeaking();
                    //       setState(() {
                    //         isSpeaking = false;
                    //       });
                    //     } else {
                    //       if (Paragraph != null) {
                    //         speakText(Paragraph!);
                    //         setState(() {
                    //           isSpeaking = true;
                    //         });
                    //       } else {
                    //         print('Paragraph is null');
                    //       }

                    //     }},
                    //     child: Icon(
                    //     isSpeaking ? Icons.mic_off : Icons.mic,
                    //     color: isSpeaking ? Colors.red : null,
                    //   ),),


                    SizedBox(width: 1,),
                    Padding(padding: EdgeInsets.only(left: 0,top: 10),
                      child:

                      GestureDetector (
                        onTap: () {
                          popupmenu;           //  When a cell is tapped, the _tapped method is called with the index of the tapped cell.
                        },
                        child: Container(
                          height: 40,
                          width: 96,
                          decoration: BoxDecoration(
                              color: menu, borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding:EdgeInsets.only(left: 10),
                                child: Text(
                                  "Menu",
                                  style: TextStyle(fontSize:15, color: themecolor),
                                ),
                              ),

                              // SizedBox(width: 1,),
                              PopupMenuButton<String>(iconSize: popupmenu,
                                color: themecolor,
                                onSelected: (String value) {

                                  if (value == 'Profile'){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>profile(userData: userData)));

                                  }
                                  else if (value == 'progress') {
                                    showAboutDialog(context: context,);
                                  }
                                  //else if (value == 'edit') {
                                  //     _scaffoldKey.currentState?.openDrawer();
                                  // }
                                  else if (value == 'Sign Out') {

                                    final _googleSignIn = GoogleSignIn(clientId:
                                        "34917283366-b806koktimo2pod1cjas8kn2lcpn7bse.apps.googleusercontent.com"
                                        // "547858986996-uar600blj54or1p62g96tgjlbmtjebk9.apps.googleusercontent.com"
                                        // "1053172784472-vr118jght00dlj7k337h8ehh52qk6si1.apps.googleusercontent.com"
                                        // "857706222236-j5f1pjpfl237794pbucgt1b5d7fr8uv2.apps.googleusercontent.com"
                                    );
                                    Future<void> GoogleSignOut() async {
                                      try{
                                        await _googleSignIn.signOut();
                                        Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (context) => SignUp(),),
                                        );
                                      } catch (error) {
                                        print("Error signing out: $error");
                                      }
                                    }
                                    GoogleSignOut();

                                  }
                                },

                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem(
                                      child:Container(
                                          height: 25,
                                          width:180,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(50),),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(left:9),
                                            child: Row(children: [
                                              Icon(
                                                Icons.person,
                                                color: Colors.black,
                                                size: 20,
                                              ),

                                              SizedBox(
                                                width: 2,
                                              ),

                                              Flexible(child:Text(userData?.email as String,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize:10,
                                                      fontWeight: FontWeight.normal))),

                                            ]),
                                          )),
                                      enabled: false,
                                    ),

                                    PopupMenuDivider(),
                                    // PopupMenuItem(
                                    //   child: ListTile(
                                    //     leading: Icon(Icons.history),
                                    //     title: Text("History"),
                                    //   ),
                                    //   value: "History",
                                    // ),
                                    // PopupMenuItem(
                                    //   child: ListTile(
                                    //     leading: Icon(Icons.trending_up),
                                    //     title: Text("My Progress"),
                                    //   ),
                                    //   value: 'Progress',
                                    // ),
                                    // PopupMenuItem(
                                    //   child: ListTile(
                                    //     leading: Icon(Icons.edit),
                                    //     title: Text('Edit Profile'),
                                    //   ),
                                    //   value: 'edit',
                                    // ),

                                    PopupMenuItem(
                                      child: ListTile(
                                        leading: Icon(Icons.edit),
                                        title: Text(" Edit Profile"),
                                      ),
                                      value: "Profile",
                                    ),
                                    PopupMenuDivider(),
                                    PopupMenuItem(
                                      child: ListTile(
                                        leading: Icon(Icons.logout),
                                        title: Text('Sign Out',style: TextStyle(color: Colors.red),),
                                      ),
                                      value: 'Sign Out',
                                    ),
                                  ];
                                },
                              ),


                            ],
                          ),
                        ),
                      ),

                    )]),

            
            ),
          actions: [
            IconButton(onPressed: (){
               themeNotifier.isDark
              ? themeNotifier.isDark=false
              : themeNotifier.isDark=true;
            }, 
            icon:Icon(themeNotifier.isDark? Icons.nightlight_round
            : Icons.wb_sunny))
          ],  
        )
    );
    },
    );
  }

  // buildDrawer() {
  //   return Drawer(
  //       child: ListView(
  //         children: [
  //           ListTile(
  //             title: Text("My profile"),
  //           )
  //         ],
  //       )
  //   );
  // }


  @override
  Size get preferredSize => Size.fromHeight(70);

  void setState(Null Function() param0) {}
}



















//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../const/color.dart';
//
//
// class appbar extends StatelessWidget implements PreferredSizeWidget {
//   final IconData? appbaricon;
//   // final Color?  themecolor;
//   final double? appbarsize;
//   final double? midpadding;
//   final double? image_height;
//   final double? image_width;
//   final double textfont;
//   double popupmenu;
//
//
//   appbar({required this.appbaricon, required this.appbarsize ,required this.popupmenu,required this.image_width,required this.image_height,required this.textfont, required this.midpadding});
//
//
//   // String valueChoose;
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         elevation: 0.0,
//         automaticallyImplyLeading: false,
//         backgroundColor: unique,
//         title: Padding(
//             padding: EdgeInsets.all(1),
//             child: Row(children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 1, top: 20),
//                 child: Container(
//                   height: image_height,
//                   width: image_width,
//                   decoration: BoxDecoration(
//                     color: unique,
//                   ),
//                   child: Image.asset(
//                     "images/new.png",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Text("English AI",style: TextStyle(color: menu,fontWeight: FontWeight.bold,fontSize: textfont),),
//               ),
//               SizedBox(width:
//               midpadding,
//               ),
//
//               // SizedBox(width: 1,),
//               // Padding(padding: EdgeInsets.only(left: 0,top: 10),
//               // child:
//               Padding(
//                 padding: const EdgeInsets.only(left: 100, top: 10),
//                 child: GestureDetector (
//
//                   onTap: () {
//                     popupmenu;           //  When a cell is tapped, the _tapped method is called with the index of the tapped cell.
//                   },
//                   child: Container(
//                     height: 40,
//                     width: 100,
//                     decoration: BoxDecoration(
//                         color: menu, borderRadius: BorderRadius.circular(20)),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 13),
//                           child: Text(
//                             "Menu",
//                             style: TextStyle(fontSize: 15, color: themecolor),
//                           ),
//                         ),
//
//                         // SizedBox(width: 1,),
//                         Padding(
//                           padding: EdgeInsets.only(left: 0, top: 0),
//                           child: Align(
//                             alignment: Alignment.topRight,
//                             child: PopupMenuButton<String>(iconSize: popupmenu,
//                               color: themecolor,
//                               onSelected: (String value) {
//
//                                 if (value == 'history') {
//
//                                 } else if (value == 'progress') {
//
//                                 } else if (value == 'edit') {
//
//                                 } else if (value == 'signout') {
//
//                                 }
//                               },
//
//
//                               itemBuilder: (BuildContext context) {
//                                 return [
//                                   PopupMenuItem(
//                                     child:Container(
//                                         height: 25,
//                                         width: 130,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                             BorderRadius.circular(50)),
//                                         child: Padding(
//                                           padding:
//                                           const EdgeInsets.only(left: 15),
//                                           child: Row(children: [
//                                             Icon(
//                                               Icons.person,
//                                               color: Colors.black,
//                                               size: 20,
//                                             ),
//
//                                             SizedBox(
//                                               width: 2,
//                                             ),
//                                             Text(
//                                               "User Name",
//                                               style: GoogleFonts.poppins(
//                                                   color: Colors.black,
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//
//                                             // Text("User Name")
//                                           ]),
//                                         )),
//                                     enabled: false,
//                                   ),
//                                   PopupMenuDivider(),
//                                   PopupMenuItem(
//                                     child: ListTile(
//                                       leading: Icon(Icons.history),
//                                       title: Text("History"),
//                                     ),
//                                     value: "History",
//                                   ),
//                                   PopupMenuItem(
//                                     child: ListTile(
//                                       leading: Icon(Icons.trending_up),
//                                       title: Text("My Progress"),
//                                     ),
//                                     value: 'Progress',
//                                   ),
//                                   PopupMenuItem(
//                                     child: ListTile(
//                                       leading: Icon(Icons.edit),
//                                       title: Text('Edit Profile'),
//                                     ),
//                                     value: 'edit',
//                                   ),
//                                   PopupMenuDivider(),
//                                   PopupMenuItem(
//                                     child: ListTile(
//                                       leading: Icon(Icons.logout),
//                                       title: Text('Sign Out'),
//                                     ),
//                                     value: 'signout',
//                                   ),
//                                 ];
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ])));
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(70);
// }
