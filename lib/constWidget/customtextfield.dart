import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final double height;
  final double width;
  final String hinttext1;
  final Color color;
  final Function(String?) validator;
  final  error;
  CustomTextField({required this.height, required this.width, required this.hinttext1,required this.color, required this.validator,required this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: color,),
      child:
      Padding(
        padding: EdgeInsets.symmetric(horizontal:10,),
        child:TextFormField(
          // onChanged: (value){String otpmail= value;},
          // validator:(value){validator(value);},
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: hinttext1,
            errorText: error,

          ),
        ),
      ),
    );
  }
}









