import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../constants.dart';
import '../models/stream_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

part 'stream_event.dart';
part 'stream_state.dart';


class StreamBloc extends Bloc<StreamEvent, StreamState> {
  StreamBloc() : super(StreamInitial()) {
    on<LoadStreams>((event, emit) async {
      emit(StreamLoading());
      try {
        final token = await getTokenFromSharedPreferences();
        final response = await http.get(
          Uri.parse('$baseUrl/api/streams/all/'),
          // Uri.parse('https://webhook.site/88dceb9e-39ec-4f4b-a7c0-fc26beb9cefc'),
          headers: {'Authorization': 'Bearer $token', "accept": "application/json"},
        );

        print(response.body);

        // Assuming response is directly a list of streams
        final List<dynamic> streamList = json.decode(response.body);
        final streams = streamList.map((json) => StreamModel.fromJson(json)).toList();
        emit(StreamLoaded(streams));
      } catch (error) {
        emit(StreamError(error.toString()));
      }
    });
  }

  Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access') ?? '';
  }
}

// class StreamBloc extends Bloc<StreamEvent, StreamState> {
//   StreamBloc() : super(StreamInitial()) {
//     on<LoadStreams>((event, emit) async{
//       emit(StreamLoading());
//       try {
//        final token = await getTokenFromSharedPreferences();
//       final response = await http.get(
//         Uri.parse('$baseUrl/api/streams/all/'),
//         headers: {'Authorization': 'Bearer $token'},
//       );

//       print(response.body);

//       final jsonData = json.decode(response.body);
//         final List<dynamic> streamList = jsonData['streams'];
//         final streams = streamList.map((json) => StreamModel.fromJson(json)).toList();
//         emit(StreamLoaded(streams));

//       // if (response.statusCode == 200) {
//       //   final jsonData = json.decode(response.body);
//       //   final List<dynamic> streamList = jsonData['streams'];
//       //   final streams = streamList.map((json) => StreamModel.fromJson(json)).toList();
//       //   emit(StreamLoaded(streams));
//       // } else {
//       //   emit(StreamError('Failed to load streams'));
//       // }
//     } catch (error) {
//       emit(StreamError(error.toString()));
//     }
//       // TODO: implement event handler
//     });
//   }

//   Future<String> getTokenFromSharedPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('access') ?? '';
//   }
// }
