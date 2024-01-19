import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context,int Score, List<String>notAvailable, int ParagraphLength) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text("Score",style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold,))),
        // content: Text(message),
        actions: <Widget>[
          Column(
            children: [
              Text("$Score/$ParagraphLength",style:TextStyle(color:Colors.purple,fontWeight: FontWeight.bold, fontSize:13)),
              Divider(color: Colors.black54,),
              SizedBox(height:10),
              Text("Incorrect Words:",style:TextStyle(color:Colors.red,fontWeight: FontWeight.bold, fontSize:15)),
              SizedBox(height:10),
              Text("$notAvailable",style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize:13) )
            ],
          ),



          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}


