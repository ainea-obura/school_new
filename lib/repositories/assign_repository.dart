import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class AssignmentRepository {
  Future<Map<String, dynamic>> assignBook({
    required String bookName,
    required String bookNo,
    required int studentId,
    required int subjectId,
  }) async {
    final token = await getTokenFromSharedPreferences();
    final Uri url = Uri.parse('$baseUrl/api/assign/create');
    //final url = Uri.parse('https://webhook.site/1e41b6fd-f7c1-401a-baa4-05186fb29f9a');
    final Map<String, dynamic> body = {
      "book_name": bookName,
      "book_no": bookNo,
      "student_id": studentId,
      "subject_id": subjectId,
    };

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      // final errorMessage = json.decode(response.body)['description'];
      final errorMessage = json.decode(response.body);
      throw Exception(errorMessage);
    } else {
      throw Exception('Failed to assign book');
    }
  }

  Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
