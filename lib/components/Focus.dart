import 'package:flutter/material.dart';
import '../const/color.dart';
import '../constWidget/textwidget.dart';

class Focas_container extends StatelessWidget {
  const Focas_container({
    Key? key,
    required this.fontsize,
    required this.focustext,
  });

  final double fontsize;
  final String focustext;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: focusmode, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Adjust this line
        children: [
          Icon(Icons.visibility),
          SizedBox(width: 8.0), // Add some spacing between the icon and text
          textwidget(focustext, fontsize, FontWeight.bold, textcolor),
        ],
      ),
    );
  }
}


// import'package:flutter/material.dart';
//
// import '../const/color.dart';
// import '../constWidget/textwidget.dart';
//
// // import '../const_style.dart';
//
// class Focas_container extends StatelessWidget {
//   const Focas_container({
//     super.key,
//     required this.height,
//     required this.width,
//     required this.fontsize,
//     required this.focustext,
//
//   });
//
//   final double height;
//   final double width;
//   final double fontsize;
//   final String focustext;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       //  Expanded(
//       //   flex:0,
//       //   child:
//       Container(
//           height:height,
//           width:width,
//           decoration:BoxDecoration(color: focusmode,borderRadius: BorderRadius.circular(15)),
//           child:Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               children: [
//                 Icon(Icons.visibility),
//                 SizedBox(width:8),
//                 textwidget(focustext,fontsize,FontWeight.bold, textcolor),
//               ],
//             ),
//           )
//         // ),
//       );
//   }
// }