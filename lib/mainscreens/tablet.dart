// import 'package:english/focus_screens/f_tablet.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../article_content.dart';
import '../components/Article.dart';
import '../components/Focus.dart';
import '../const/color.dart';
import '../constWidget/textwidget.dart';
import '../focus_screens/f_tablet.dart';
import 'aap_bar.dart';




class tabletPage extends StatefulWidget {
  const tabletPage({super.key, required this.title});

  final String title;

  @override
  State<tabletPage> createState() => _tabletPageState();
}

class _tabletPageState extends State<tabletPage> {
  double textsize=20;
  int selected_index=3;
  int selected_index2=0;

  int article_name_in=0;

  List<Article_Model> article_content=[];
  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://merd-api.merakilearn.org/englishAi/content'));

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

  @override
  void initState(){
    super.initState();
    fetchData();
  }

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
        appbaricon: Icons.person,
        appbarsize: 16,midpadding:mq.width*0.1500,image_height: 20,image_width: 40,textfont: 18,popupmenu: 15,
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
                      Article_image(height:mq.height*0.15,width:mq.width*0.20),
                      const SizedBox(width:25),
                      Flexible(child: textwidget(article_content[article_name_in].title,30, FontWeight.bold, textcolor)),
                      //  const SizedBox(width:30)
                    ],),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      // InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>f_tabletPage(article_name_in: article_name_in, selected_index: selected_index, selected_index2: selected_index2, fontsize: textsize)));} ,child: Focas_container(focustext:"Enter Focus Mode",height:mq.height* 0.050,width:mq.width*0.300,fontsize:15)),
                      InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>f_tabletPage(article_name_in: article_name_in,article_content:article_content, selected_index: selected_index, selected_index2: selected_index2, fontsize: textsize)));} ,
                          child: Focas_container(focustext:"Enter Focus Mode",height:mq.height* 0.060,width:mq.width*0.300,fontsize:15,)),

                      const SizedBox(width:130),
                      Row(
                          children:[
                            FloatingActionButton(elevation: 0.0,backgroundColor:
                            selected_index2==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {selected_index2=1;textsize=18;});},
                                child: textwidget("A", 18, FontWeight.w700, Colors.black)),

                            FloatingActionButton(elevation: 0.0,backgroundColor:
                            selected_index2==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                onPressed:(){setState(() {selected_index2=2;textsize=20;});},
                                child: textwidget("A", 20, FontWeight.w700, Colors.black)),

                            FloatingActionButton(elevation: 0.0,backgroundColor:
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[
                                    textwidget("Level",30, FontWeight.bold, menu),
                                    SizedBox(width:25),

                                    //DIFFERENT LEVEL ACCORDING TO THE NUMBERS'S  CONTAINER
                                    Container(
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children:[
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==1?Color.fromARGB(255, 113, 168, 47):Colors.white,

                                              onPressed:(){setState(() {selected_index=1;});},child: textwidget("1", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                              onPressed:(){setState(() {selected_index=2;});},child: textwidget("2", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                              onPressed:(){setState(() {selected_index=3;});},child: textwidget("3", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==4?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                              onPressed:(){setState(() {selected_index=4;});},child: textwidget("4", 20, FontWeight.w300, textcolor)),
                                          // const SizedBox(width:20,),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==5?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                              onPressed:(){setState(() {selected_index=5;});},child: textwidget("5", 20, FontWeight.w300, textcolor)),
                                        ],),
                                    ),
                                  ]),
                            ))

                      ]),
                  SizedBox(height:20),

                  // ARTICLE CONTENT
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        child:((){
                          if (selected_index==1){
                            return  textwidget(article_content[article_name_in].level1,textsize, FontWeight.w200, Colors.black,);
                          }
                          else if (selected_index==2){
                            return textwidget(article_content[article_name_in].level2,textsize, FontWeight.w200, Colors.black,);
                          }
                          else if (selected_index==3){
                            return textwidget(article_content[article_name_in].level3,textsize, FontWeight.w200, Colors.black,);
                          }
                          else if (selected_index==4){
                            return textwidget(article_content[article_name_in].level4,textsize, FontWeight.w200, Colors.black,);
                          }
                          else{
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
                    InkWell(
                        onTap: (){setState((){if(article_name_in>0){article_name_in--;}});}, child: Image.asset("images/left-arrow.png",height:35,width:35)),
                    InkWell(onTap: (){setState((){if(article_name_in<4){article_name_in++;}});},child: Image.asset("images/right-arrow-black-triangle.png",height:35,width:35))
                  ])),
        ],
      ),
    );
  }
}

