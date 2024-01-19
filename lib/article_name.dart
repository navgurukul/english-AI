import 'dart:convert';

// import 'package:englishetc_voice_ai/api_function/model.dart';
// import 'package:englishetc_voice_ai/const/color.dart';
// import 'package:englishetc_voice_ai/constWidget/textwidget.dart';
// import 'package:englishetc_voice_ai/mainscreens/aap_bar.dart';
import 'package:etc/components/api_function/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_function/model.dart';
import 'mainscreens/aap_bar.dart';

class article_names extends StatefulWidget {

  List<Article_Model>article_content;
  article_names({required this.article_content});

  get userData => null;





  @override
  State<article_names> createState() => _article_namesState();
}


class _article_namesState extends State<article_names> {
  int selected_index=3;
  int selected_index2=0;
  int article_name_in=0;
  List<Article_Model> article_content=[];
  @override
  void initState() {
    super.initState();
    article_content = widget.article_content;
  }


  @override
  Widget build(BuildContext context) {
    var mq= MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(

          appBar: appbar(
            Paragraph: null,
            userData: widget.userData,
            appbaricon: Icons.person,
            appbarsize: 16,image_height: 20,image_width: 40,textfont: 18,popupmenu: 15, cleanedWord: null, notAvailable: '', score: null,
          ),

          body:Column(
            children: [
              Center(
                child: Text(
                  "Article Index",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Expanded(

                child: ListView.builder(
                  itemCount: widget.article_content.length,
                  itemBuilder: (BuildContext context, int index) {
                    final numberedIndex = index + 1;
                    final articleTitle = widget.article_content[index].title;

                    return ListTile(
                        title: Text("$numberedIndex. $articleTitle"));
},
                ),
              ),
              // You can add more widgets below the ListView.builder if needed
            ],
          )



      ),


    );
  }
}
