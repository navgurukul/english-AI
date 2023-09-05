
import 'package:flutter/material.dart';

import '../const/color.dart';

class Article_image extends StatelessWidget {
  const Article_image({
    super.key,
    required this.height,
    required this.width,
  

  });

  final double height;
  final double width;
  

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:40.0, vertical:40),
            child: Container(
              height:height,
              width:width,
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(40) ),color: highlights),
            ),
          ),

          Positioned(
              top:30,
              right:60,
              child:
              Container(
                height:height,
                width:width,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20) )),
                )
          ),
        ]
    );
  }
}