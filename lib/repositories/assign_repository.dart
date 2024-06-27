import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class AssignmentRepository {
  Future<Map<String, dynamic>> assignBook({
    required String bookNo,
    required int studentId,
    required int subjectId,
  }) async {
    final token = await getTokenFromSharedPreferences();
    final Uri url = Uri.parse('$baseUrl/api/books/assign/');
    // final url = Uri.parse('https://webhook.site/8d5f1899-e6c4-49c0-87da-178796e43d8b');
    final Map<String, dynamic> body = {
      "book_no": bookNo,
      "student": studentId,
      "book": subjectId,
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
    if (response.statusCode == 201 || response.statusCode == 200) {
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
    return prefs.getString('access') ?? '';
  }
}
