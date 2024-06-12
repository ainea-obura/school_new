//import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class ClearRepository {
  Future<String> clearAssignment(int assignId) async {
    final String apiUrl = '$baseUrl/api/assignments/clear/$assignId';
    final token = await getTokenFromSharedPreferences();

    final response = await http.delete(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', 
      },
    );

    if (response.statusCode == 200) {
      return "Cleared successfully";
    } else {
      throw Exception("Failed to clear assignment: ${response.statusCode}");
    }
  }

   Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
