
import"package:flutter/material.dart";

Widget textwidget(String text, double fontsize ,fontweight,Color color){
  return Text(text,
      // softWrap: true,
      // overflow: TextOverflow.ellipsis,
      style:
      TextStyle(
          fontSize:fontsize ,
          fontWeight: fontweight,
          color: color));
}

// import"package:flutter/material.dart";
//
// Widget textwidget(String text, double fontsize ,fontweight,Color color){
//   return Text(text,
//       style:
//       TextStyle(
//           fontSize:fontsize ,
//           fontWeight: fontweight,
//           color: color));
// }