// import 'package:english/screen/aap_bar.dart';
// import 'package:english/focus_screens/f_desktop.dart';
import 'package:flutter/material.dart';
import '../article_content.dart';
import '../components/Article.dart';
import '../components/Focus.dart';
import '../const/color.dart';
import '../constWidget/textwidget.dart';
import '../focus_screens/f_desktop.dart';
import 'aap_bar.dart';

// hghjhhjkhkjhkjhhhhhhkh


class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key, required this.title});



  final String title;

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {

  // Color btn_col=Colors.white;

  Color btn_col = Colors.white;
  double textsize=20;


  int selected_index=3;
  int article_name_in=0;
  int selected_index2=1;






  @override
  Widget build(BuildContext context) {
    var mq= MediaQuery.of(context).size;
    return Scaffold(
      // appbar
      appBar: appbar(
        appbaricon: Icons.person,
        appbarsize: 16,midpadding:mq.width*0.720,image_height: 20,image_width: 40,textfont: 18,popupmenu: 15,
      ),

      backgroundColor: Colors.white,

      body: Column(
        children: [
          Expanded(
            flex:1,
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
                        Article_image(height:mq.height*0.15,width:mq.width*0.15,imgurl: articles[article_name_in]['article_image'],),

                        // Article name
                        const SizedBox(width:0),
                        textwidget(articles[article_name_in]['article_name'],25, FontWeight.bold, textcolor),

                        // Article in Focus mode
                        const SizedBox(width:0),
                        InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder:
                            (context)=>f_DesktopPage(article_name_in: article_name_in, selected_index: selected_index, selected_index2: selected_index2, textsize: textsize)));} ,child:Focas_container(focustext:"Enter Focus Mode",height:mq.height* 0.080,width:mq.width* 0.15,fontsize:17))

                      ],),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Level_con(m_height:70, m_width:840, level_text_size:20, space_l_b:20),
                        Container(
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
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==1?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selected_index=1;});},child: textwidget("1", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==2?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selected_index=2;});},child: textwidget("2", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==3?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selected_index=3;});},child: textwidget("3", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==4?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selected_index=4;});},child: textwidget("4", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          selected_index==5?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {selected_index=5;});},child: textwidget("5", 20, FontWeight.w300, textcolor)),
                                        ],),
                                    ),
                                  ]),
                            )),


                        // Article font size

                        SizedBox(width:250),

                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(height:30,
                            child:Row(mainAxisAlignment: MainAxisAlignment.start,

                              children:[
                                FloatingActionButton(elevation: 0.0,backgroundColor:
                                selected_index2==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {selected_index2=1;textsize=22;});},
                                    child: textwidget("A",15, FontWeight.w500, Colors.black)),
                                FloatingActionButton(elevation: 0.0,backgroundColor:
                                selected_index2==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {selected_index2=2;textsize=24;});},
                                    child: textwidget("A", 20, FontWeight.w500, Colors.black)),
                                FloatingActionButton(elevation: 0.0,backgroundColor:
                                selected_index2==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {selected_index2=3;textsize=26;});},
                                    child: textwidget("A",23, FontWeight.w500, Colors.black)),

                              ],),
                          ),
                        ),

                      ],),
                    SizedBox(height:30),
                    // Article content
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: textwidget(articles[article_name_in]['versions'][selected_index-1],
                                textsize, FontWeight.w300,Colors.black))
                    ),

                  ],
                ),
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






