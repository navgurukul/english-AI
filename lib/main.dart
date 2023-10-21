
// import 'package:englishetc_voice_ai/mainscreens/desktop.dart';
// import 'package:englishetc_voice_ai/mainscreens/mobile.dart';
// import 'package:englishetc_voice_ai/mainscreens/tablet.dart';
// import 'package:englishetc_voice_ai/responsive/responsive_layout.dart';
// import 'package:englishetc_voice_ai/splash.dart';
// import 'package:englishetc_voice_ai/voice_re.dart';
import 'package:etc/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';




void main() {
  runApp(const MyApp());
  FlutterTts flutterTts = FlutterTts();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get googleSignInAccount => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'English_AI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
        ),

        // home:ErrorPronunciation()
        home:splashScreen()
      // home: Responsive_layout(
      //           mobileScaffold: MobilePage(title: 'mobilepage',userdata:googleSignInAccount),
      //           tabletScaffold: tabletPage(title: 'tabletpage',userdata:googleSignInAccount),
      //           desktopScaffold: DesktopPage(title: 'desktoppage',userdata:googleSignInAccount))

    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});


//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }


// // import 'package:english/mainscreens/desktop.dart';
// // import 'package:english/mainscreens/mobile.dart';
// // import 'package:english/mainscreens/tablet.dart';
// import 'package:etc/responsive/responsive_layout.dart';
// import 'package:flutter/material.dart';
// // import 'package:request_permission/request_permission.dart';
//
// import 'mainscreens/desktop.dart';
// import 'mainscreens/mobile.dart';
// import 'mainscreens/tablet.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   final int article_name_in=0;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'English AI',
//       theme:
//       ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan)),
//       debugShowCheckedModeBanner: false,
//       // home: splash(),
//       home: Responsive_layout(
//           mobileScaffold: MobilePage(title: 'mobilepage',article_name_in: article_name_in,),
//           tabletScaffold: tabletPage(title: 'tabletpage',),
//           desktopScaffold: DesktopPage(title: 'desktoppage',)),
//     );
//   }
// }
//
//
//
