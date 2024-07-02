import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../models/student_assigned_model.dart';
import 'student_assigned_state.dart';

class StudentAssignedCubit extends Cubit<StudentAssignedState> {
  StudentAssignedCubit() : super(StudentAssignedLoading());

  Future<void> getStudentAssigned(student_id) async {
    try {
       final token = await getTokenFromSharedPreferences();
      final response = await http.get(
        Uri.parse('$baseUrl/api/books/assigned-books/student/$student_id'),
        headers: {'Authorization': 'Bearer $token', "accept": "application/json"},
      );
print(response.body);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> studentAssignedList = jsonData;
        final studentAssigneds = studentAssignedList.map((json) => StudentAssignedModel.fromJson(json)).toList();
        emit(StudentAssignedLoaded(studentAssigneds));
      } else {
        emit(StudentAssignedError('Failed to load assigned books'));
      }
    } catch (e) {
      emit(StudentAssignedError('Error: $e'));
    }
  }

  Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access') ?? '';
  }
}