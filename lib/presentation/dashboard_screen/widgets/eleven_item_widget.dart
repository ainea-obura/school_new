import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../student_search_clear_screen/student_search_clear_screen.dart';
import 'package:flutter/material.dart';
import 'package:school_new/core/app_export.dart';

import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ElevenItemWidget extends StatefulWidget {
  ElevenItemWidget({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<ElevenItemWidget> createState() => _ElevenItemWidgetState();
}

class _ElevenItemWidgetState extends State<ElevenItemWidget> {

   bool _loggingOut = false;

  Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access') ?? '';
  }
  Future<String> getRefreshTkn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('refresh') ?? '';
  }

  Future<void> logout() async {

     setState(() {
      _loggingOut = true; 
    });
    
    final token = await getTokenFromSharedPreferences();
    final refresh = await getRefreshTkn();
    
    var url = Uri.parse('$baseUrl/api/auth/logout/');

    var response = await http.post(
      url,
      headers: {'Authorization': 'Bearer $token'},
      body: json.encode({"refresh_token": refresh}),
    );

    print(response.body);

    if (response.statusCode == 205) {
      // Successful logout, navigate to login page
      // if (context.mounted)Navigator.of(context).pushReplacementNamed('/login'); 
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
      }
    } else {
      // Logout failed, handle the error
      print('Logout failed: ${response.reasonPhrase}');
      // You can show an error message or handle the situation accordingly
    }
    setState(() {
      _loggingOut = false; // Reset the flag after logout process completes
    });
  }

  // ElevenItemModel elevenItemModelObj;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  width: 100, // Adjust the width as needed
                  height: 100,
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        // Action for Assign books
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //       builder: (context) => const AssignBooks()),
                        // );
                        NavigatorService.pushNamed(
                          AppRoutes.specifyClassScreen,
                        );
                      },
                      child: const Center(child: Text('Assign books')),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 11.0),
                child: Container(
                  width: 100, // Adjust the width as needed
                  height: 100,
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        // NavigatorService.pushNamed(
                        //   AppRoutes.studentSearchResultsScreen,
                        // );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const StudentSearchClearScreen()),
                        );
                      },
                      child: const Center(child: Text('Clear books')),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 11.0),
                child: Container(
                  width: 100, // Adjust the width as needed
                  height: 100,
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           const ChangePasswordPage()),
                        // );
                      },
                      child: const Center(child: Text('Change password')),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 11.0),
                child: Container(
                  width: 100, // Adjust the width as needed
                  height: 100,
                  // child: Card(
                  //           child: InkWell(
                  //             onTap: () {
                  //               // logout(); // Call the logout function on tap
                  //             },
                  //             child: const Center(child: Text('Logout')),
                  //           ),
                  //         ),
                    child: _loggingOut
                        ? const Center(
                            child:
                                CircularProgressIndicator(), // Show progress indicator when logging out
                          )
                        : Card(
                            child: InkWell(
                              onTap: () {
                                logout(); // Call the logout function on tap
                              },
                              child: const Center(child: Text('Logout')),
                            ),
                          ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
   
  }
}
