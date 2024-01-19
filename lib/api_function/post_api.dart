// import 'dart:convert';
// // import 'package:englishetc_voice_ai/api_function/model.dart';
// import 'package:http/http.dart' as http;
//
//
// Map<String,dynamic> userPostData={};
// Future<dynamic> postData(userPostData) async {
//   // Define the API endpoint URL
//   String apiUrl = 'https://merd-api.merakilearn.org/englishAi/history?english_ai_id=3';
//
//   // Prepare the data to send
//
//   String jsonData = json.encode(userPostData);
//
//   try {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjM0MDkwIiwiZW1haWwiOiJzYW5qbmFwYW53YXIyMUBuYXZndXJ1a3VsLm9yZyIsImlhdCI6MTY5NDY3Mzg3NSwiZXhwIjoxNzI2MjMxNDc1fQ.c4QHm-TgTx84a-Ha55D3W4zAJctCEvfm-tT73Hv-VoA"
//       },
//       body: jsonData, // The JSON data to send
//     );
//
//     // Check the response status code to handle success or errors
//     if (response.statusCode == 201) {
//       // Request was successful (status code 201 Created)
//       print('Data posted successfully');
//     } else {
//       // Handle errors, e.g., by parsing the response body
//       final Map<String, dynamic> responseData = json.decode(response.body);
//       print('Error: ${responseData['error']}');
//     }
//     print('Response Status Code: ${response.statusCode}');
//     print('Response Body: ${response.body}');
//
//   } catch (e) {
//     // Handle network errors or other exceptions
//     print('Error: $e');
//   }
// }
//
//
