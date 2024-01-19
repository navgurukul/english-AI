// import 'package:flutter/material.dart';
// // import 'package:speech_to_text/speech_to_text.dart' as stt;
//
//
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // final stt.SpeechToText _speech = stt.SpeechToText();
//   bool _isListening = false;
//   String _text = '';
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _initializeSpeech();
//   // }
//   //
//   // Future<void> _initializeSpeech() async {
//   //   await _speech.initialize(
//   //     onStatus: (status) {
//   //       print('Speech recognition status: $status');
//   //     },
//   //   );
//   // }
//
// //   Future<void> _startListening() async {
// //     if (!_isListening) {
// //       bool available = await _speech.initialize();
// //       if (available) {
// //         setState(() {
// //           _isListening = true;
// //         });
// //         _speech.listen(
// //           onResult: (result) {
// //             setState(() {
// //               _text = result.recognizedWords;
// //             });
// //           },
// //         );
// //       }
// //     }
// //   }
// //
// //   Future<void> _stopListening() async {
// //     if (_isListening) {
// //       setState(() {
// //         _isListening = false;
// //       });
// //       await _speech.stop();
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Speech Recognition Demo'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Text(
// //               'Speech Recognition:',
// //               style: TextStyle(fontSize: 16.0),
// //             ),
// //             Text(
// //               _text,
// //               style: TextStyle(fontSize: 24.0),
// //             ),
// //             SizedBox(height: 20.0),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: <Widget>[
// //                 FloatingActionButton(
// //                   onPressed: _startListening,
// //                   child: Icon(Icons.mic),
// //                   backgroundColor: Colors.green,
// //                 ),
// //                 SizedBox(width: 20.0),
// //                 FloatingActionButton(
// //                   onPressed: _stopListening,
// //                   child: Icon(Icons.stop),
// //                   backgroundColor: Colors.red,
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _speech.stop();
// //     super.dispose();
// //   }
// }
//
