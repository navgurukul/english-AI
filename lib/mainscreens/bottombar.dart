
import "package:flutter/material.dart";


class bottomScreen extends StatefulWidget {
  // const bottomScreen({super.key,required this.article_name_in});

  // final int article_name_in;

  @override
  State<bottomScreen> createState() => bottomScreenState();
}

class bottomScreenState extends State<bottomScreen> {


  int  article_name_in=0;
  int btn_index=0;

  void ontapped(index){
    setState(() {
      btn_index=index;
    });
    if (btn_index==0){
      previous_article();
    }
    else{
      next_article();
    }
  }

  void previous_article(){
    setState(() {
      if (article_name_in<4){
        article_name_in++;}
    });

  }


  void next_article(){
    setState(() {
      if (article_name_in>0){
        article_name_in--;}
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      BottomNavigationBar(
        selectedFontSize: 10.0,
        iconSize: 10.0,
        currentIndex:btn_index,
        onTap: ontapped,
        items: [
          BottomNavigationBarItem(icon:Image.asset("images/left-arrow.png",height: 10.0),label:(""),backgroundColor: Colors.black,),
          BottomNavigationBarItem(icon:Image.asset("images/right-arrow-black-triangle.png",height: 10,),label:(""),backgroundColor: Colors.black,),
        ],

      ),

    );
  }
}






//
// import "package:flutter/material.dart";
//
//
// class bottomScreen extends StatefulWidget {
//   // const bottomScreen({super.key,required this.article_name_in});
//
//   // final int article_name_in;
//
//   @override
//   State<bottomScreen> createState() => bottomScreenState();
// }
//
// class bottomScreenState extends State<bottomScreen> {
//
//
//   int  article_name_in=0;
//   int btn_index=0;
//
//   void ontapped(index){
//     setState(() {
//       btn_index=index;
//     });
//     if (btn_index==0){
//       previous_article();
//     }
//     else{
//       next_article();
//     }
//   }
//
//   void previous_article(){
//     setState(() {
//       if (article_name_in<4){
//         article_name_in++;}
//     });
//
//   }
//
//
//   void next_article(){
//     setState(() {
//       if (article_name_in>0){
//         article_name_in--;}
//     });
//
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar:
//       BottomNavigationBar(
//         selectedFontSize: 10.0,
//         iconSize: 10.0,
//         currentIndex:btn_index,
//         onTap: ontapped,
//         items: [
//           BottomNavigationBarItem(icon:Image.asset("images/left-arrow.png",height: 10.0),label:(""),backgroundColor: Colors.black,),
//           BottomNavigationBarItem(icon:Image.asset("images/right-arrow-black-triangle.png",height: 10,),label:(""),backgroundColor: Colors.black,),
//         ],
//
//       ),
//
//     );
//   }
// }
//
//
//
//
//
