
import 'dart:async';
import 'dart:convert';
// import 'package:englishetc_voice_ai/api_function/model.dart';
// import 'package:englishetc_voice_ai/article_name.dart';
// import 'package:englishetc_voice_ai/components/Article.dart';
// import 'package:englishetc_voice_ai/components/Focus.dart';
// import 'package:englishetc_voice_ai/const/color.dart';
// import 'package:englishetc_voice_ai/constWidget/textwidget.dart';
// import 'package:englishetc_voice_ai/focus_screens/f_tablet.dart';
// import 'package:englishetc_voice_ai/ttsexample.dart';
import 'package:etc/components/api_function/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
// import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../api_function/model.dart';
import '../article_name.dart';
import '../components/Article.dart';
import '../components/Focus.dart';
import '../const/color.dart';
import '../constWidget/textwidget.dart';
import '../focus_screens/f_tablet.dart';
import '../ttsexample.dart';
import 'aap_bar.dart';





class tabletPage extends StatefulWidget {
  tabletPage({super.key, required this.title, required this.userdata});
  GoogleSignInAccount? userdata;
  final String title;

  @override
  State<tabletPage> createState() => _tabletPageState();
}

class _tabletPageState extends State<tabletPage> {
  double textsize=20;
  int selected_index=3;
  int selected_index2=0;
  var Paragraph='';
  int article_name_in=0;
  StreamController _uiChangeStreamController=StreamController();
  // final stt.SpeechToText _speech=stt.SpeechToText();

  bool _isListening=false;
  String _text="";



  @override
  void initState() {
    super.initState();
    fetchData(); // Call the function to fetch data when the widget initializes
  }

  // @override
  // void initState(){
  //   super.initState();
  //   fetchData();
  //   _initializeSpeech();
  // }
  //
  // Future <void> _initializeSpeech()async{
  //   await _speech.initialize(
  //       onStatus : (status){
  //         print("Speech recongnition status: $status");
  //       });
  //
  // }

  // List availablecontent=["article 1","article 2","article 3","article 4","level 1","level 2","level 3","level 4","level 5"];
  // Future<void> _startListening() async {
  //   if (!_isListening) {
  //     // bool available = await _speech.initialize();
  //     bool available = await _speech.initialize();
  //
  //     if (available) {
  //       setState(() {
  //         _isListening = true;
  //       });
  //       _speech.listen(
  //         onResult: (result) {
  //           setState(() {
  //             _text = result.recognizedWords.toLowerCase(); // Convert to lowercase for case-insensitive matching
  //             print(_text);
  //
  //             // Check recognized voice command and change the level
  //
  //             if (_text.contains("level 1")) {
  //               setState(() {
  //                 selected_index = 1;
  //               });
  //             } else if (_text.contains("level 2")) {
  //               setState(() {
  //                 selected_index = 2;
  //               });
  //             } else if (_text.contains("level 3")) {
  //               setState(() {
  //                 selected_index = 3;
  //               });
  //             } else if (_text.contains("level 4")) {
  //               setState(() {
  //                 selected_index = 4;
  //               });
  //             } else if (_text.contains("level 5")) {
  //               setState(() {
  //                 selected_index = 5;
  //               });
  //             }
  //
  //
  //             // Check recognized voice command and change the topic
  //
  //             else if (_text.contains("article 1")){
  //               setState(() {
  //                 article_name_in=0;
  //               });
  //             } else if (_text.contains("article 2")){
  //               setState(() {
  //                 article_name_in= 1;
  //               });
  //
  //
  //             }else if (_text.contains("article 3")){
  //               setState(() {
  //                 article_name_in=2;
  //               });
  //
  //
  //             }else if (_text.contains("article 4")) {
  //               setState(() {
  //                 article_name_in = 3;
  //               });
  //             }
  //             // }else if (!availablecontent.contains(_text)){
  //             //   ScaffoldMessenger.of(context).showSnackBar(
  //             //     SnackBar(
  //             //       content: Text('invalid content'),
  //             //
  //             //     ),
  //             //   );
  //             // }
  //
  //           });
  //         },
  //       );
  //     }
  //   }
  // }

  // Future<void> _stopListening() async {
  //   if (_isListening) {
  //     setState(() {
  //       _isListening = false;
  //     });
  //     await _speech.stop();
  //   }
  // }




  FlutterTts flutterTts = FlutterTts();
  Future<void> speakText(String Paragraph) async {
    final ttsExample = TtsExample(); // Create an instance of the TtsExample class
    await ttsExample.speakText(Paragraph); // Call the speakText function


    // Emit a UI change event to stop the AI
    _uiChangeStreamController.sink.add(null);
  }

  Future<void> stopSpeaking() async {
    await flutterTts.stop(); // Stop TTS
  }

  //hello
  List<Article_Model> article_content=[];
  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://merd-api.merakilearn.org/englishAi/content/today'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body)['articles'] as List<dynamic>;

        setState(() {
          article_content = jsonData
              .map((data) => Article_Model.fromJson(data as Map<String, dynamic>))
              .toList();
        });

        print(article_content);
        print("hello");
      } else {
        // Handle error if the API request fails.
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }



  // @override
  //  void initState(){
  //   super.initState();
  //   fetchData();
  //  }



  @override
  Widget build(BuildContext context) {
    var mq= MediaQuery.of(context).size;
    if (article_content.isEmpty){
      return const Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Loading",
            style: TextStyle(fontSize:15,color:Colors.black),),
          SizedBox(height: 10,),
          CircularProgressIndicator(

            strokeWidth:4.0,
          )
        ],
      )
      );
    }
    return Scaffold(
      appBar:appbar(
        Paragraph: Paragraph,
        userData: widget.userdata,
        appbaricon: Icons.person,
        appbarsize: 16,image_height: 20,image_width: 40,textfont: 18,popupmenu: 15, cleanedWord: null, notAvailable: '', score: null,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child:
          SingleChildScrollView(physics:AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Article_image(height:mq.height*0.15,width:mq.width*0.20, imgurl: 'images/games.jpeg',),
                      const SizedBox(width:25),
                      Flexible(child: textwidget(article_content[article_name_in].title,25, FontWeight.bold, textcolor)),
                      //  const SizedBox(width:30)

                    ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[

                      InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>f_tabletPage(article_name_in: article_name_in,article_content:article_content, selected_index: selected_index, selected_index2: selected_index2, fontsize: textsize)));} ,
                          child: Focas_container(focustext:"Enter Focus Mode",fontsize:15,)),
                      // height:mq.height* 0.050,width:mq.width*0.250,
                      const SizedBox(width:150),
                      Row(
                          children:[
                            FloatingActionButton(elevation: 0.0,shape:CircleBorder( ),backgroundColor:
                            selected_index2==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {selected_index2=1;textsize=18;});},
                                child: textwidget("A", 18, FontWeight.w700, Colors.black)),

                            FloatingActionButton(elevation: 0.0,shape:CircleBorder( ),backgroundColor:
                            selected_index2==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {selected_index2=2;textsize=20;});},
                                child: textwidget("A", 20, FontWeight.w700, Colors.black)),
                            FloatingActionButton(elevation: 0.0,shape:CircleBorder( ),backgroundColor:
                            selected_index2==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {selected_index2=3;textsize=25;});},
                                child: textwidget("A",23, FontWeight.w700, Colors.black)),

                          ]),


                    ],),

                  // LEVEL ROW

                  const SizedBox(height:20),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width:mq.width*0.750,
                            height:mq.height*0.07,

                            // LEVEL TEXT
                            child:Padding(
                              padding: const EdgeInsets.only(left:20.0,right:20.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    textwidget("Level",30, FontWeight.bold, menu),
                                    SizedBox(width:30),

                                    //DIFFERENT LEVEL ACCORDING TO THE NUMBERS'S  CONTAINER

                                    Container(
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children:[
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==1?Color.fromARGB(255, 113, 168, 47):Colors.white,shape:CircleBorder( ),

                                              onPressed:(){setState(() {selected_index=1;});},child: textwidget("1", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==2?Color.fromARGB(255, 113, 168, 47):Colors.white,shape:CircleBorder( ),
                                              onPressed:(){setState(() {selected_index=2;});},child: textwidget("2", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==3?Color.fromARGB(255, 113, 168, 47):Colors.white,shape:CircleBorder( ),
                                              onPressed:(){setState(() {selected_index=3;});},child: textwidget("3", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==4?Color.fromARGB(255, 113, 168, 47):Colors.white,shape:CircleBorder( ),
                                              onPressed:(){setState(() {selected_index=4;});},child: textwidget("4", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==5?Color.fromARGB(255, 113, 168, 47):Colors.white,shape:CircleBorder( ),
                                              onPressed:(){setState(() {selected_index=5;});},child: textwidget("5", 20, FontWeight.w300, textcolor)),
                                        ],),
                                    ),
                                    // ),

                                  ]),
                            ))

                      ]),
                  // SizedBox(height:20),
                  //
                  // Row(
                  //   children: [
                  //     ElevatedButton(onPressed:(){if (Paragraph != null) {speakText(Paragraph!);}}, child:Icon(Icons.speaker)),
                  //     SizedBox(width:15),
                  //     ElevatedButton(onPressed: (){stopSpeaking();}, child:Icon(Icons.speaker_notes_off)),
                  //     SizedBox(width:15),
                  //     ElevatedButton(onPressed: (){_startListening();}, child:Icon(Icons.mic)),
                  //     SizedBox(width:15),
                  //     ElevatedButton(onPressed: (){_stopListening();}, child:Icon(Icons.stop)),
                  //   ],
                  // ),

                  // ARTICLE CONTENT
                  SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        child:((){
                          if (selected_index==1){
                            Paragraph=article_content[article_name_in].level2;
                            return  textwidget(article_content[article_name_in].level1,textsize, FontWeight.w200, Colors.black,);
                          }
                          else if (selected_index==2){
                            Paragraph=article_content[article_name_in].level2;
                            return textwidget(article_content[article_name_in].level2,textsize, FontWeight.w200, Colors.black,);
                          }
                          else if (selected_index==3){
                            Paragraph=article_content[article_name_in].level2;
                            return textwidget(article_content[article_name_in].level3,textsize, FontWeight.w200, Colors.black,);
                          }
                          else if (selected_index==4){
                            Paragraph=article_content[article_name_in].level2;
                            return textwidget(article_content[article_name_in].level4,textsize, FontWeight.w200, Colors.black,);
                          }
                          else{
                            Paragraph=article_content[article_name_in].level2;
                            return textwidget(article_content[article_name_in].level5,textsize, FontWeight.w200, Colors.black,);
                          }

                        })()
                    ),
                  )

                ], ),




            ),
          ),
          ),

          Container(height: 60,width:mq.width
              ,child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    InkWell( onTap: (){setState((){if(article_name_in>0){article_name_in--;}});}, child: Image.asset("images/left-arrow.png",height:35,width:35)),
                    InkWell(onTap: (){setState((){if(article_name_in<article_content.length-1){article_name_in++;}});},child: Image.asset("images/right-arrow-black-triangle.png",height:35,width:35)),
                    InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>article_names(article_content: article_content)));}, child:Text("Content",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),))

                  ])),


        ],
      ),
    );
  }
  // @override
  // void dispose() {
  //   _speech.stop();
  //   super.dispose();
  //   _uiChangeStreamController.close(); // Close the stream when the widget is disposed
  //   super.dispose();
  // }

}



// // import 'package:english/focus_screens/f_tablet.dart';
// import 'package:flutter/material.dart';
//
// import '../article_content.dart';
// import '../components/Article.dart';
// import '../components/Focus.dart';
// import '../const/color.dart';
// import '../constWidget/textwidget.dart';
// import '../focus_screens/f_tablet.dart';
// import 'aap_bar.dart';
//
//
//
//
// class tabletPage extends StatefulWidget {
//   const tabletPage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<tabletPage> createState() => _tabletPageState();
// }
//
// class _tabletPageState extends State<tabletPage> {
//   double textsize=20;
//   int selected_index=3;
//   int selected_index2=0;
//
//   int article_name_in=0;
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var mq= MediaQuery.of(context).size;
//     return Scaffold(
//       appBar:appbar(
//         appbaricon: Icons.person,
//         appbarsize: 16,midpadding:mq.width*0.460,image_height: 20,image_width: 40,textfont: 18,popupmenu: 15,
//       ),
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Expanded(child:
//           SingleChildScrollView(physics:AlwaysScrollableScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//
//                   Row(
//                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Article_image(height:mq.height*0.15,width:mq.width*0.20,imgurl: articles[article_name_in]['article_image']),
//                       const SizedBox(width:25),
//                       textwidget(articles[article_name_in]['article_name'],40, FontWeight.bold, textcolor),
//                       //  const SizedBox(width:30)
//
//                     ],),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children:[
//
//                       InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>f_tabletPage(article_name_in: article_name_in, selected_index: selected_index, selected_index2: selected_index2, fontsize: textsize)));} ,child: Focas_container(focustext:"Enter Focus Mode",height:mq.height* 0.050,width:mq.width*0.300,fontsize:15)),
//
//                       const SizedBox(width:150),
//                       Row(
//                           children:[
//                             FloatingActionButton(elevation: 0.0,backgroundColor:
//                             selected_index2==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
//                                 onPressed:(){setState(() {selected_index2=1;textsize=18;});},
//                                 child: textwidget("A", 18, FontWeight.w700, Colors.black)),
//
//                             FloatingActionButton(elevation: 0.0,backgroundColor:
//                             selected_index2==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
//                                 onPressed:(){setState(() {selected_index2=2;textsize=20;});},
//                                 child: textwidget("A", 20, FontWeight.w700, Colors.black)),
//                             FloatingActionButton(elevation: 0.0,backgroundColor:
//                             selected_index2==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
//                                 onPressed:(){setState(() {selected_index2=3;textsize=25;});},
//                                 child: textwidget("A",23, FontWeight.w700, Colors.black)),
//
//                           ]),
//
//
//                     ],),
//
//                   // LEVEL ROW
//
//                   const SizedBox(height:20),
//                   Row(mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                             width:mq.width*0.750,
//                             height:mq.height*0.07,
//
//                             // LEVEL TEXT
//                             child:Padding(
//                               padding: const EdgeInsets.only(left:20.0,right:20.0),
//                               child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children:[
//                                     textwidget("Level",30, FontWeight.bold, menu),
//                                     SizedBox(width:30),
//
//                                     //DIFFERENT LEVEL ACCORDING TO THE NUMBERS'S  CONTAINER
//
//                                     Container(
//                                       child:Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children:[
//                                           FloatingActionButton(elevation:0.0,backgroundColor:
//                                           selected_index==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
//
//                                               onPressed:(){setState(() {selected_index=1;});},child: textwidget("1", 20, FontWeight.w300, textcolor)),
//                                           // const SizedBox(width:20,),
//                                           FloatingActionButton(elevation:0.0,backgroundColor:
//                                           selected_index==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
//                                               onPressed:(){setState(() {selected_index=2;});},child: textwidget("2", 20, FontWeight.w300, textcolor)),
//                                           // const SizedBox(width:20,),
//                                           FloatingActionButton(elevation:0.0,backgroundColor:
//                                           selected_index==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
//                                               onPressed:(){setState(() {selected_index=3;});},child: textwidget("3", 20, FontWeight.w300, textcolor)),
//                                           // const SizedBox(width:20,),
//                                           FloatingActionButton(elevation:0.0,backgroundColor:
//                                           selected_index==4?Color.fromARGB(255, 113, 168, 47):Colors.white,
//                                               onPressed:(){setState(() {selected_index=4;});},child: textwidget("4", 20, FontWeight.w300, textcolor)),
//                                           // const SizedBox(width:20,),
//                                           FloatingActionButton(elevation:0.0,backgroundColor:
//                                           selected_index==5?Color.fromARGB(255, 113, 168, 47):Colors.white,
//                                               onPressed:(){setState(() {selected_index=5;});},child: textwidget("5", 20, FontWeight.w300, textcolor)),
//                                         ],),
//                                     ),
//                                     // ),
//
//                                   ]),
//                             ))
//
//                       ]),
//                   SizedBox(height:20),
//
//                   // ARTICLE CONTENT
//
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Container(
//                         child: textwidget(articles[article_name_in]['versions'][selected_index-1],
//                           textsize, FontWeight.w200, Colors.black,)
//                     ),
//                   )
//
//                 ], ),
//
//
//
//
//             ),
//           ),
//           ),
//
//           Container(height: 60,width:mq.width
//               ,child:Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children:[
//                     InkWell(
//                         onTap: (){setState((){if(article_name_in>0){article_name_in--;}});}, child: Image.asset("images/left-arrow.png",height:35,width:35)),
//                     InkWell(onTap: (){setState((){if(article_name_in<4){article_name_in++;}});},child: Image.asset("images/right-arrow-black-triangle.png",height:35,width:35))
//                   ])),
//
//
//         ],
//       ),
//     );
//   }
// }
//
