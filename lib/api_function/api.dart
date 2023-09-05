


// import 'package:http/http.dart' as http;
import 'dart:convert';



class Article_Model{
  late String title;
  late String level1;
  late String level2;
  late String level3;
  late String level4;
  late String level5;

  Article_Model({required this.title,required this.level1,required this.level2,required this.level3, required this.level4, required this.level5});

  factory Article_Model.fromJson(Map<String,dynamic> json){
    return Article_Model(
      title:  json['title'] as String ,
      level1: json['level1'] as String , 
      level2: json['level2'] as String , 
      level3: json['level3'] as String , 
      level4: json['level4'] as String , 
      level5: json['level5'] as String );
  }
  
}

