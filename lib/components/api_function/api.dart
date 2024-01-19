//
//
//
//
// //   API   MODEL
//
// class Article_Model{
//   late String title;
//   late String level1;
//   late String level2;
//   late String level3;
//   late String level4;
//   late String level5;
//
//   Article_Model({required this.title,required this.level1,required this.level2,required this.level3, required this.level4, required this.level5});
//
//   factory Article_Model.fromJson(Map<String,dynamic> json){
//     return Article_Model(
//         title:  json['title'] as String ,
//         level1: json['level1'] as String ,
//         level2: json['level2'] as String ,
//         level3: json['level3'] as String ,
//         level4: json['level4'] as String ,
//         level5: json['level5'] as String );
//   }
//
// }
//
// // List<Article_Model> article_content=[];
// // Future<void> fetchData() async {
// //   try {
// //     final response = await http.get(Uri.parse('https://merd-api.merakilearn.org/englishAi/content'));
//
// //     if (response.statusCode == 200) {
// //       final jsonData = json.decode(response.body)['articles'] as List<dynamic>;
//
// //       setState(() {
// //         article_content = jsonData
// //             .map((data) => Article_Model.fromJson(data as Map<String, dynamic>))
// //             .toList();
// //       });
//
// //       print(article_content);
// //       print("hello");
// //     } else {
// //       // Handle error if the API request fails.
// //       print('API request failed with status code: ${response.statusCode}');
// //     }
// //   } catch (e) {
// //     print('Error fetching data: $e');
// //   }
// // }
//
//
//
//
//
