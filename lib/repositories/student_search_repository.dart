import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/students_model.dart';

class SearchStudentsRepository {
  Future<List<Student>> searchForStudent(String query, String token) async {
    // Construct the URL with query parameters
    final Uri url = Uri.parse('$baseUrl/api/students/search').replace(queryParameters: {'q': query});

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      final List<dynamic> studentsJson = decodedJson;
      return studentsJson
          .map((studentJson) => Student.fromJson(studentJson))
          .toList();
    } else {
      throw Exception('Students not found');
    }
  }
}


// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// // ignore: unused_import
// import 'package:shared_preferences/shared_preferences.dart';

// import '../constants.dart';
// import '../models/students_model.dart';

// class SearchStudentsRepository {
//   Future<List<Student>> searchForStudent(String query, String token) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/students/search'),
//       //Uri.parse('https://webhook.site/a0778818-a1ca-4776-8cb2-b1617f8ff4dc'),
//       headers: {
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({'query': query}),
//     );
//     if (kDebugMode) {
//       print(response.body);
//     }
//     if (response.statusCode == 200) {
//       final decodedJson = jsonDecode(response.body);
//       final List<dynamic> studentsJson = decodedJson['students'];
//       return studentsJson
//           .map((studentJson) => Student.fromJson(studentJson))
//           .toList();
//     } else {
//       throw Exception('Students not found');
//     }
//   }
// }
