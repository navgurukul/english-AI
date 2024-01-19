
import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../api_function/model.dart';
import '../components/Article.dart';
import '../components/Focus.dart';
import '../const/color.dart';
import '../constWidget/textwidget.dart';
import '../focus_screens/f_desktop.dart';
import '../ttsexample.dart';
import 'aap_bar.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;



class DesktopPage extends StatefulWidget {
  DesktopPage({super.key, required this.title, required this.userdata});


  GoogleSignInAccount? userdata;
  final String title;

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {

  Color btn_col = Colors.white;
  double textsize=20;
  var Paragraph;
  int selected_index=1;
  int article_name_in=2;
  int selected_index2=1;
  StreamController _uiChangeStreamController=StreamController();
  final stt.SpeechToText _speech=stt.SpeechToText();
  String userVoiceData='';
  Map<String,dynamic> userPostData={};
  List<String> heyspeak=[];
  List<String> notAvailable = [];
  List<String> Available = [];
  bool _isListening=false;
  String _text="";
  bool isSpeaking = true;
  bool isStopping = false;


  @override
  void initState(){
    super.initState();
    fetchData();
    _initializeSpeech();
  }


  /////////////// SPEECH TO TEXT FUNCTION //////////////////////////

  Future <void> _initializeSpeech()async{
    await _speech.initialize(
        onStatus : (status){
          print("Speech recongnition status: $status");
        });

  }

  List availablecontent=["article 1","article 2","article 3","article 4","level 1","level 2","level 3","level 4","level 5"];
  Future<void> _startListening() async {
    if (!_isListening) {

      bool available = await _speech.initialize();

      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
          onResult: (result) {
            setState(() {
              _text = result.recognizedWords.toLowerCase();

              heyspeak = _text.split(' ');
              // print("$heyspeak yes");

              if (_text.contains("level 1")) {
                setState(() {
                  selected_index = 1;
                });
              } else if (_text.contains("level 2")) {
                setState(() {
                  selected_index = 2;
                });
              } else if (_text.contains("level 3")) {
                setState(() {
                  selected_index = 3;
                });
              } else if (_text.contains("level 4")) {
                setState(() {
                  selected_index = 4;
                });
              } else if (_text.contains("level 5")) {
                setState(() {
                  selected_index = 5;
                });
              }


              // Check recognized voice command and change the topic /////////////////////////////////////

              else if (_text.contains("article 1")){
                setState(() {
                  article_name_in=0;
                });
              } else if (_text.contains("article 2")){
                setState(() {
                  article_name_in= 1;
                });


              }else if (_text.contains("article 3")){
                setState(() {
                  article_name_in=2;
                });


              }else if (_text.contains("article 4")) {
                setState(() {
                  article_name_in = 3;
                });
              }
            });

          },

        );
      }

    }
  }

  Future<void> _stopListening() async {
    if (_isListening) {
      setState(() {
        // heyspeak.add(_text);
        _isListening = false;
      });
      await _speech.stop();
    }
  }

  //////////////////// TEXT TO SPEECH FUNCTION /////////////////////////

  FlutterTts flutterTts = FlutterTts();
  Future<bool> speakText(String Paragraph) async {
    final ttsExample = TtsExample(); // Create an instance of the TtsExample class
    bool success;
    try {
      await ttsExample.speakText(Paragraph); // Call the speakText function
      success = true;
    } catch (e) {
      success = false;
      print('Failed to speak: $e');
    }

    if (success) {
      // Emit a UI change event to stop the AI
      _uiChangeStreamController.sink.add(null);
    }
    return success;
  }

  Future<bool> stopSpeaking() async {
    bool success;
    try {
      await flutterTts.stop();
      success = true;
    } catch (e) {
      success = false;
      print('Failed to stop speaking: $e');
    }
    return success;
  }


  ///////////////// PRONUNCIATION WORDS or Speaking Test FUNCTION ////////////////////


  TextSpan buildTextSpan(List<String> words) {
    List<InlineSpan> spans = [];
    for (String word in words) {
      spans.add(
        TextSpan(
          text: word + ' ', // Include a space to separate words
          style: TextStyle(
            // decoration: TextDecoration.underline,
            color: Colors.black,
            fontSize:textsize,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              pronounceWord(word);
            },
        ),
      );
    }
    // return TextSpan();
    return TextSpan(children: spans);
  }

  Future<void> pronounceWord(String word) async {
    await flutterTts.speak(word);}



  //////////////// Used ChatGPT API to fetch Data //////////////////

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



      } else {
        // Handle error if the API request fails.
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }


/////////////// Start Main Body or Screen Of The Code/////////////////

  @override
  Widget build(BuildContext context) {
    // Paragraph= article_content[article_name_in].level2;
    var mq= MediaQuery.of(context).size;
    if (article_content.isEmpty){

      return const Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Loading the data",
            style: TextStyle(fontSize:15,color:Colors.black),),
          SizedBox(height: 10,),
          CircularProgressIndicator(
            strokeWidth:0.7,
          )
        ],
      ));
    }
    return Scaffold(
      // appbar
      appBar: appbar(
        Paragraph: Paragraph,
        userData: widget.userdata,
        appbaricon: Icons.person,
        appbarsize: 16,image_height: 20,image_width: 40,textfont: 18,popupmenu: 15, cleanedWord: null, notAvailable: '', score: null,
      ),

      backgroundColor: Colors.white,

      body:Column(
        children: <Widget>[

          Expanded(
            child:
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding:  EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // Article image
                        Article_image(height:mq.height*0.15,width:mq.width*0.15, imgurl: 'images/games.jpeg',),

                        // Article name
                        const SizedBox(width:0),


                        Flexible(child: textwidget(article_content[article_name_in].title,25, FontWeight.bold, textcolor)),

                        // Article in Focus mode
                        const SizedBox(width:0),
                        InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder: ((context) => f_DesktopPage(article_name_in: article_name_in, selected_index: selected_index, article_content: article_content, selected_index2: selected_index2, textsize: textsize))));
                        },
                            child:Focas_container(focustext:"Enter to focus Mode",fontsize:17, ))
                        //  height:mq.height* 0.090,width:mq.width* 0.17
                      ],),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Level_con(m_height:70, m_width:840, level_text_size:20, space_l_b:20),
                        Container(
                          //  color: Colors.red,
                            width:mq.width*0.450,
                            height:mq.height*0.090,
                            // LEVEL TEXT
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[
                                    textwidget("Level",25, FontWeight.bold, menu),
                                    SizedBox(width:20),

                                    //DIFFERENT LEVEL ACCORDING TO THE NUMBERS'S  CONTAINER


                                    Container(
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children:[
                                          FloatingActionButton(elevation:0.0,shape:CircleBorder( ),backgroundColor:
                                          selected_index==1?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selected_index=1;});},child: textwidget("1", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,shape:CircleBorder( ),backgroundColor:
                                          selected_index==2?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selected_index=2;});},child: textwidget("2", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,shape:CircleBorder( ),backgroundColor:
                                          selected_index==3?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selected_index=3;});},child: textwidget("3", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,shape:CircleBorder( ),backgroundColor:
                                          selected_index==4?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selected_index=4;});},child: textwidget("4", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,shape:CircleBorder( ),backgroundColor:
                                          selected_index==5?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selected_index=5;});},child: textwidget("5", 20, FontWeight.w300, textcolor)),
                                        ],),
                                    ),


                                  ]),
                            )),


                        // Article font size

                        SizedBox(width:250),
                        Expanded(
                          child: Container(height:30,
                            child:Row(mainAxisAlignment: MainAxisAlignment.start,

                              children:[
                                FloatingActionButton(elevation: 0.0,shape:CircleBorder( ),backgroundColor:
                                selected_index2==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {selected_index2=1;textsize=22;});},
                                    child: textwidget("A",15, FontWeight.w500, Colors.black)),
                                FloatingActionButton(elevation: 0.0,shape:CircleBorder( ),backgroundColor:
                                selected_index2==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {selected_index2=2;textsize=24;});},
                                    child: textwidget("A", 20, FontWeight.w500, Colors.black)),
                                FloatingActionButton(elevation: 0.0,shape:CircleBorder( ),backgroundColor:
                                selected_index2==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {selected_index2=3;textsize=26;});},
                                    child: textwidget("A",23, FontWeight.w500, Colors.black)),

                              ],),
                          ),
                        ),


                      ],),
                    SizedBox(height:20),

                    Align(alignment: Alignment.centerLeft,
                      child: Container(width: 100,
                        decoration: BoxDecoration(color: focusmode,borderRadius: BorderRadius.circular(50),border: Border.all(width: 3,color: highlights),
                        ),
                        child: Align(alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (Paragraph != null) {
                                      if (isSpeaking && !isStopping) {
                                        isStopping = true;
                                        isSpeaking = false;
                                        stopSpeaking().then((success) {
                                          isStopping = false;
                                        });
                                      } else {
                                        isSpeaking = true;
                                        isStopping = false;
                                        speakText(Paragraph!).then((success) {
                                          if (!success) {
                                            isSpeaking = false;
                                            isStopping = true;
                                          }
                                        });
                                      }
                                    }
                                  });
                                },
                                child: Image.asset(
                                  isSpeaking
                                      ? (isStopping ? "images/horn.png" : "images/horn.png")
                                      : "images/no horn.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ),


                              SizedBox(width: 8,),
                              InkWell(
                                onTap: () {
                                },
                                child: Text(
                                  'Listen',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),


                    // Row(
                    //   children: [
                    //     ElevatedButton(onPressed:(){if (Paragraph != null) {speakText(Paragraph!);}}, child:Icon(Icons.speaker)),
                    //     SizedBox(width:15),
                    //     ElevatedButton(onPressed: (){stopSpeaking();}, child:Icon(Icons.speaker_notes_off)),
                    //     SizedBox(width:15),
                    //     ElevatedButton(onPressed: (){_startListening();}, child:Icon(Icons.mic)),
                    //     SizedBox(width:15),
                    //     ElevatedButton(onPressed: (){_stopListening();}, child:Icon(Icons.stop)),
                    //     SizedBox(width:15),
                    //     ElevatedButton(onPressed: (){_startListening();
                    //     userVoiceData =_text;
                    //     // heyspeak.add(userVoiceData);
                    //
                    //     print("this is the user voice $userVoiceData yes");
                    //     }, child:textwidget("start", 10, FontWeight.bold, Color.fromARGB(255, 25, 104, 82))),
                    //     SizedBox(width:15),
                    //     ElevatedButton(onPressed: (){
                    //       _stopListening();
                    //       int score = 0;// Iterate through heyspeak and perform the checks
                    //       final cleanedWord = Paragraph.replaceAll(RegExp(r'[^\w\s]'), '').trim().split(" ");
                    //       for (String word in heyspeak) {
                    //         if (Paragraph.contains(word)) {
                    //           Available.add(word);
                    //           score++; // Increment the score if the word is found in the paragraph
                    //         } else {
                    //           notAvailable.add(word); // Add the word to notAvailable if it's not found
                    //         }
                    //       }// Print the results
                    //       print("Words not available in paragraph: $notAvailable");
                    //       // print("Words available in paragraph: $Available");
                    //       int ParagraphLength= cleanedWord.length;
                    //       print("Your Score: $score/ $ParagraphLength");
                    //       // print(Paragraph.length);
                    //       showAlertDialog(context,score, notAvailable,ParagraphLength );
                    //     },
                    //
                    //         child:textwidget("finish", 10, FontWeight.bold, Color.fromARGB(255, 25, 104, 82))
                    //     ),
                    //
                    //   ],
                    // ),

                    SizedBox(height:30),
                    // Article content

                    // Wrap the part that displays the article content with StreamBuilder
                    // StreamBuilder(
                    //   stream: _uiChangeStreamController.stream,
                    //   builder: (context, snapshot) {
                    //     // Check if an event is received
                    //     if (snapshot.hasData) {
                    //       // Stop the AI when an event is received
                    //       stopSpeaking();
                    //     }

                    // Return the UI for displaying the article content
                    // return
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: (() {
                          if (selected_index == 1) {

                            Paragraph = article_content[article_name_in].level1;
                            List<String> words = Paragraph.split(' ');

                            return RichText(text:buildTextSpan(words));


                            // return textwidget(article_content[article_name_in].level1, textsize, FontWeight.w200, Colors.black);
                          } else if (selected_index == 2) {

                            Paragraph = article_content[article_name_in].level2;
                            List<String> words = Paragraph.split(' ');
                            return RichText(text:buildTextSpan(words));

                            // return textwidget(article_content[article_name_in].level2, textsize, FontWeight.w200, Colors.black);
                          } else if (selected_index == 3) {

                            Paragraph = article_content[article_name_in].level3;
                            List<String> words = Paragraph.split(' ');
                            return RichText(text:buildTextSpan(words));

                            // return textwidget(article_content[article_name_in].level3, textsize, FontWeight.w200, Colors.black);
                          } else if (selected_index == 4) {

                            Paragraph = article_content[article_name_in].level4;
                            List<String> words = Paragraph.split(' ');
                            return RichText(text:buildTextSpan(words));
                            // return textwidget(article_content[article_name_in].level4, textsize, FontWeight.w200, Colors.black);
                          } else {

                            Paragraph = article_content[article_name_in].level5;
                            List<String> words = Paragraph.split(' ');
                            return RichText(text:buildTextSpan(words));
                            // return textwidget(article_content[article_name_in].level5, textsize, FontWeight.w200, Colors.black);
                          }
                        })(),
                      ),
                    ),
                    //   },
                    // ),



                  ],
                ),
              ),
            ),
          ),

          Container(height: 60,width:mq.width
              ,child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    InkWell(onTap: (){setState((){if(article_name_in>0){article_name_in--;}});}, child: Image.asset("images/left-arrow.png",height:35,width:35)),
                    InkWell(onTap: (){
                      setState(() {

                        if(_isListening){
                          _stopListening();
                        }else{
                          _startListening();
                        }
                      });
                    },child: Image.asset( _isListening ? 'images/offmicrophone.png' : 'images/microphone.png',
                      height: 40,
                      width: 40,),),
                    InkWell(onTap: (){setState((){if(article_name_in<article_content.length-1){article_name_in++;}});},child: Image.asset("images/right-arrow-black-triangle.png",height:35,width:35)),
                    // InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>article_names(article_content: article_content)));},child:Text("Content",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),))
                  ])),

          // Container(height: 60,width:mq.width
          //     ,child:Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children:[
          //           InkWell(onTap: (){setState((){if(article_name_in>0){article_name_in--;}});}, child: Image.asset("images/left-arrow.png",height:35,width:35)),
          //           InkWell(onTap: (){setState((){if(article_name_in<article_content.length-1){article_name_in++;}});},child: Image.asset("images/right-arrow-black-triangle.png",height:35,width:35)),
          //           // InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>article_names(article_content: article_content)));},child:Text("Content",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),))
          //         ])),



        ],),
    );
  }



  @override
  void dispose() {
    _speech.stop();
    super.dispose();
    _uiChangeStreamController.close(); // Close the stream when the widget is disposed
    super.dispose();
  }




}








// // import 'package:english/screen/aap_bar.dart';
// // import 'package:english/focus_screens/f_desktop.dart';
// import 'package:flutter/material.dart';
// import '../article_content.dart';
// import '../components/Article.dart';
// import '../components/Focus.dart';
// import '../const/color.dart';
// import '../constWidget/textwidget.dart';
// import '../focus_screens/f_desktop.dart';
// import 'aap_bar.dart';
//
//
//
//
// class DesktopPage extends StatefulWidget {
//   const DesktopPage({super.key, required this.title});
//
//
//
//   final String title;
//
//   @override
//   State<DesktopPage> createState() => _DesktopPageState();
// }
//
// class _DesktopPageState extends State<DesktopPage> {
//
//   // Color btn_col=Colors.white;
//
//   Color btn_col = Colors.white;
//   double textsize=20;
//
//
//   int selected_index=3;
//   int article_name_in=0;
//   int selected_index2=1;
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var mq= MediaQuery.of(context).size;
//     return Scaffold(
//       // appbar
//       appBar: appbar(
//         appbaricon: Icons.person,
//         appbarsize: 16,midpadding:mq.width*0.720,image_height: 20,image_width: 40,textfont: 18,popupmenu: 15,
//       ),
//
//       backgroundColor: Colors.white,
//
//       body: Column(
//         children: [
//           Expanded(
//             flex:1,
//             child:
//             SingleChildScrollView(
//               physics: ScrollPhysics(),
//               child: Padding(
//                 padding:  EdgeInsets.all(25.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//
//                         // Article image
//                         Article_image(height:mq.height*0.15,width:mq.width*0.15,imgurl: articles[article_name_in]['article_image'],),
//
//                         // Article name
//                         const SizedBox(width:0),
//                         textwidget(articles[article_name_in]['article_name'],25, FontWeight.bold, textcolor),
//
//                         // Article in Focus mode
//                         const SizedBox(width:0),
//                         InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder:
//                             (context)=>f_DesktopPage(article_name_in: article_name_in, selected_index: selected_index, selected_index2: selected_index2, textsize: textsize)));} ,child:Focas_container(focustext:"Enter Focus Mode",height:mq.height* 0.080,width:mq.width* 0.15,fontsize:17))
//
//                       ],),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Level_con(m_height:70, m_width:840, level_text_size:20, space_l_b:20),
//                         Container(
//                             width:mq.width*0.450,
//                             height:mq.height*0.090,
//                             // LEVEL TEXT
//                             child:Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children:[
//                                     textwidget("Level",25, FontWeight.bold, menu),
//                                     SizedBox(width:20),
//
//                                     //DIFFERENT LEVEL ACCORDING TO THE NUMBERS'S  CONTAINER
//                                     Container(
//                                       child:Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children:[
//                                           FloatingActionButton(elevation:0.0,backgroundColor:
//                                           selected_index==1?Colors.lightGreen:Colors.white,
//                                               onPressed:(){setState(() {selected_index=1;});},child: textwidget("1", 20, FontWeight.w300, textcolor)),
//                                           FloatingActionButton(elevation:0.0,backgroundColor:
//                                           selected_index==2?Colors.lightGreen:Colors.white,
//                                               onPressed:(){setState(() {selected_index=2;});},child: textwidget("2", 20, FontWeight.w300, textcolor)),
//                                           FloatingActionButton(elevation:0.0,backgroundColor:
//                                           selected_index==3?Colors.lightGreen:Colors.white,
//                                               onPressed:(){setState(() {selected_index=3;});},child: textwidget("3", 20, FontWeight.w300, textcolor)),
//                                           FloatingActionButton(elevation:0.0,backgroundColor:
//                                           selected_index==4?Colors.lightGreen:Colors.white,
//                                               onPressed:(){setState(() {selected_index=4;});},child: textwidget("4", 20, FontWeight.w300, textcolor)),
//                                           FloatingActionButton(elevation:0.0,backgroundColor:
//                                           selected_index==5?Colors.lightGreen:Colors.white,
//                                               onPressed:(){setState(() {selected_index=5;});},child: textwidget("5", 20, FontWeight.w300, textcolor)),
//                                         ],),
//                                     ),
//                                   ]),
//                             )),
//
//
//                         // Article font size
//
//                         SizedBox(width:250),
//
//                         Padding(
//                           padding: const EdgeInsets.all(1.0),
//                           child: Container(height:30,
//                             child:Row(mainAxisAlignment: MainAxisAlignment.start,
//
//                               children:[
//                                 FloatingActionButton(elevation: 0.0,backgroundColor:
//                                 selected_index2==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
//                                     onPressed:(){setState(() {selected_index2=1;textsize=22;});},
//                                     child: textwidget("A",15, FontWeight.w500, Colors.black)),
//                                 FloatingActionButton(elevation: 0.0,backgroundColor:
//                                 selected_index2==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
//                                     onPressed:(){setState(() {selected_index2=2;textsize=24;});},
//                                     child: textwidget("A", 20, FontWeight.w500, Colors.black)),
//                                 FloatingActionButton(elevation: 0.0,backgroundColor:
//                                 selected_index2==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
//                                     onPressed:(){setState(() {selected_index2=3;textsize=26;});},
//                                     child: textwidget("A",23, FontWeight.w500, Colors.black)),
//
//                               ],),
//                           ),
//                         ),
//
//                       ],),
//                     SizedBox(height:30),
//                     // Article content
//                     Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Container(
//                             child: textwidget(articles[article_name_in]['versions'][selected_index-1],
//                                 textsize, FontWeight.w300,Colors.black))
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
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
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
