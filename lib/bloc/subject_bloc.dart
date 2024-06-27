import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../models/subject_model.dart';

part 'subject_event.dart';
part 'subject_state.dart';



class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  SubjectBloc() : super(SubjectInitial()) {
    on<LoadSubjects>((event, emit) async {
      emit(SubjectLoading());
      try {
        final token = await getTokenFromSharedPreferences();
        final response = await http.get(
          // Uri.parse('$baseUrl/api/subjects/all/'),
          Uri.parse('https://webhook.site/88dceb9e-39ec-4f4b-a7c0-fc26beb9cefc'),
          headers: {'Authorization': 'Bearer $token'},
        );

        print(response.body);

        // Assuming response is directly a list of Subjects
        final List<dynamic> SubjectList = json.decode(response.body);
        final Subjects = SubjectList.map((json) => SubjectModel.fromJson(json)).toList();
        emit(SubjectLoaded(Subjects));
      } catch (error) {
        emit(SubjectError(error.toString()));
      }
    });
  }

  Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access') ?? '';
  }
}

// class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
//   SubjectBloc() : super(SubjectInitial()) {
//     on<LoadSubjects>((event, emit) async {
//       emit(SubjectLoading());
//       try {
//        final token = await getTokenFromSharedPreferences();
//       final response = await http.get(
//         Uri.parse('$baseUrl/api/subjects/all/'),
//         //Uri.parse('https://webhook.site/a0778818-a1ca-4776-8cb2-b1617f8ff4dc'),
//         headers: {'Authorization': 'Bearer $token'},
//       );
//       print(response.body);

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         final List<dynamic> subjectList = jsonData['subjets'];
//         final subjects = subjectList.map((json) => SubjectModel.fromJson(json)).toList();
//         emit(SubjectLoaded(subjects));
//       } else {
//         emit(SubjectError('Failed to load subjects'));
//       }
//     } catch (e) {
//       emit(SubjectError('Error: $e'));
//     }
//     //   try {
//     //    final token = await getTokenFromSharedPreferences();
//     //   final response = await http.get(
//     //     Uri.parse('$baseUrl/api/subject/all'),
//     //     headers: {'Authorization': 'Bearer $token'},
//     //   );

//     //   print(response.body);

//     //   final jsonData = json.decode(response.body);
//     //     final List<dynamic> subjectList = jsonData['subjects'];
//     //     final subjects = subjectList.map((json) => SubjectModel.fromJson(json)).toList();
//     //     emit(SubjectLoaded(subjects));

    
//     // } catch (error) {
//     //   emit(SubjectError(error.toString()));
//     // }
//       // TODO: implement event handler
//     });
//   }

//   Future<String> getTokenFromSharedPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('access') ?? '';
//   }
// }

