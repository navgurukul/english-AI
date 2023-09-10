
import 'dart:convert';
import 'package:etc/mainscreens/tablet.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:etc/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
// import 'mainscreens/desktop.dart';
// import 'mainscreens/mobile.dart';
// import 'mainscreens/tablet.dart';
import 'package:http/http.dart' as http;

import 'desktop.dart';
import 'mobile.dart';



// void main() {
//   runApp(const MyApp());
// }

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  final int article_name_in=0;
  List<dynamic> apiData = [];

  //
  // Future<void> fetchData() async {
  //   final response  = await http.get(
  //     Uri.parse('https://merd-api.merakilearn.org/englishAi/content'),
  //   );
  //
  //   if (response.statusCode ==200){
  //     setState(() {
  //       apiData = json.decode(response.body);
  //     });
  //   } else {
  //     throw Exception ('failed to load data from the API');
  //   }
  // }
  //
  // @override
  // void initState(){
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English AI',
      theme:
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan)),
      debugShowCheckedModeBanner: false,
      home: Responsive_layout(
          mobileScaffold: MobilePage(title: 'mobilepage',article_name_in: article_name_in,),
          tabletScaffold: tabletPage(title: 'tabletpage',),
          desktopScaffold: DesktopPage(title: 'desktoppage',)),
    );
  }
}



