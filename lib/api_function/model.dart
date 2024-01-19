

class Article_Model{
  late String title;
  late String level1;
  late String level2;
  late String level3;
  late String level4;
  late String level5;
  

  Article_Model({r,required this.title,required this.level1,required this.level2,required this.level3, required this.level4, required this.level5});


  factory Article_Model.fromJson(Map<dynamic,dynamic> json){
    return Article_Model(

        title: json['title'] as String,
        level1: json['levelWise']['level_1']['content'] as String,
        level2: json['levelWise']['level_2']['content'] as String,
        level3: json['levelWise']['level_3']['content'] as String,
        level4: json['levelWise']['level_4']['content'] as String,
        level5: json['levelWise']['level_5']['content'] as String,

  );
}
      
  
}






 
