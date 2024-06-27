import 'dart:io';

import '../constants.dart';
import '../models/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository {
  // final http.Client client;

  // LoginRepository(this.client);

  Future<User> login(String email, String password) async {

    try{
    final response = await http.post(
      //Uri.parse('http://localhost:8000/api/login'),
      // Uri.parse("https://webhook.site/34630feb-d6a0-4fbb-b26e-28588c6485d0"),
      Uri.parse('$baseUrl/api/auth/login/'),

      //followRedirects: false,
      headers: {
        'Content-Type': 'application/json',
        "accept": "application/json"
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else if(response.statusCode == 401){
     // print(data);
     final data = jsonDecode(response.body);
      throw Exception(data["error"]); 
    }else {
      throw Exception('Login failed: ${response.statusCode}');
    }
    }on SocketException {
      throw Exception('No internet connection'); // throw an exception with the "No internet connection" message
    }catch (e){
      throw Exception('$e');
    }
  }
}


// import '../constants.dart';
// import '../models/user_model.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// abstract class LoginRepository {
//   Future<User> login(String email, String password);
// }

// class HttpLoginRepository implements LoginRepository {
//   final http.Client client;

//   HttpLoginRepository(this.client);

//   @override
//   Future<User> login(String email, String password) async {
//     final response = await client.post(
//       Uri.parse('$baseUrl/api/login'),
//       headers: {
//         'Content-Type': 'application/json',
//         "accept": "application/json"
//       },
//       body: jsonEncode({
//         'email': email,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return User.fromJson(data);
//     } else if(response.statusCode == 400){
//      // print(data);
//      final data = jsonDecode(response.body);
//       throw Exception(data["error"]);
//     }
//     else {
//       throw Exception('Login failed with status code: ${response.statusCode}');
//     }
//   }
// }