// import 'package:english/screen/aap_bar.dart';

import 'package:etc/api_function/api.dart';
import 'package:etc/components/Article.dart';
import 'package:etc/components/Focus.dart';
import 'package:etc/const/color.dart';
import 'package:etc/constWidget/textwidget.dart';
import 'package:flutter/material.dart';


class f_DesktopPage extends StatefulWidget {


  f_DesktopPage({required this.article_name_in, required this.selected_index,required this.article_content,required this.selected_index2,required this.textsize});
  int article_name_in;
  int selected_index;
  int selected_index2;
  List<Article_Model> article_content;
  double textsize;
  @override
  State<f_DesktopPage> createState() => _f_DesktopPageState();
}

class _f_DesktopPageState extends State<f_DesktopPage> {

  // Color btn_col=Colors.white;


  Color btn_col = Colors.white;
 
  @override
  Widget build(BuildContext context) {
    
    

    var mq= MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Colors.white,

      body: Column(
        children: [
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
                        Article_image(height:mq.height*0.15,width:mq.width*0.15,),

                        // Article name
                        const SizedBox(width:0),
                        textwidget(widget.article_content[widget.article_name_in].title,25, FontWeight.bold, textcolor),

                        // Article in Focus mode
                        const SizedBox(width:0),
                        InkWell(onTap:(){Navigator.pop(context);},
                        child:Focas_container(focustext:"Exit from focus Mode",height:mq.height* 0.080,width:mq.width* 0.15,fontsize:17,))                      ],),

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
                                          widget.selected_index==1?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {widget.selected_index=1;});},child: textwidget("1", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          widget.selected_index==2?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {widget.selected_index=2;});},child: textwidget("2", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          widget.selected_index==3?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {widget.selected_index=3;});},child: textwidget("3", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          widget.selected_index==4?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {widget.selected_index=4;});},child: textwidget("4", 20, FontWeight.w300, textcolor)),
                                          FloatingActionButton(elevation:0.0,backgroundColor:
                                          widget.selected_index==5?Colors.lightGreen:Colors.white,
                                              onPressed:(){setState(() {widget.selected_index=5;});},child: textwidget("5", 20, FontWeight.w300, textcolor)),
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
                                widget.selected_index2==1?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {widget.selected_index2=1;widget.textsize=22;});},
                                    child: textwidget("A",15, FontWeight.w500, Colors.black)),
                                FloatingActionButton(elevation: 0.0,backgroundColor:
                                widget.selected_index2==2?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {widget.selected_index2=2;widget.textsize=24;});},
                                    child: textwidget("A", 20, FontWeight.w500, Colors.black)),
                                FloatingActionButton(elevation: 0.0,backgroundColor:
                                widget.selected_index2==3?Color.fromARGB(255, 113, 168, 47):Colors.white,
                                    onPressed:(){setState(() {widget.selected_index2=3;widget.textsize=26;});},
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
                            child:((){
                              if (widget.selected_index==1){
                                return  textwidget(widget.article_content[widget.article_name_in].level1,widget.textsize, FontWeight.w200, Colors.black,);
                                }
                              else if (widget.selected_index==2){
                                return textwidget(widget.article_content[widget.article_name_in].level2,widget.textsize, FontWeight.w200, Colors.black,);
                              }
                              else if (widget.selected_index==3){
                               return textwidget(widget.article_content[widget.article_name_in].level3,widget.textsize, FontWeight.w200, Colors.black,);
                              }
                              else if (widget.selected_index==4){
                              return textwidget(widget.article_content[widget.article_name_in].level4,widget.textsize, FontWeight.w200, Colors.black,);
                             }
                             else{
                              return textwidget(widget.article_content[widget.article_name_in].level5,widget.textsize, FontWeight.w200, Colors.black,);
                             }
                             
                             })()
                             )
                    ),

                  ],
                ),
              ),
            ),
          ),

          

        ],
      ),
    );
  }
}
