import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/students_model.dart';
import '../repositories/student_search_repository.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final SearchStudentsRepository _repository;
  StudentBloc(this._repository) : super(StudentInitial()) {
    on<SearchStudent>((event, emit) async {
      try {
      emit(StudentLoading());
      // final prefs = await SharedPreferences.getInstance();
      // final token = prefs.getString('token') ?? '';
      final token = await getTokenFromSharedPreferences();
      if (token.isEmpty) {
        throw Exception('Token not available');
      }
      
      final students = await _repository.searchForStudent(event.query, token);
      emit(StudentLoaded(students: students));
    } catch (e) {
      emit(StudentError( e.toString()));
    }
  });
  }

  Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
