import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:school_new/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/form_model.dart';
import 'package:http/http.dart' as http;

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormsState> {
  FormBloc() : super(FormInitial()) {

    on<LoadForms>((event, emit) async {
      emit(FormLoading());
      try {
        final token = await getTokenFromSharedPreferences();
        final response = await http.get(
          Uri.parse('$baseUrl/api/forms/all/'),
          // Uri.parse('https://webhook.site/88dceb9e-39ec-4f4b-a7c0-fc26beb9cefc'),
          headers: {'Authorization': 'Bearer $token', "accept": "application/json"},
        );

        print(response.body);

        // Assuming response is directly a list of streams
        final List<dynamic> formList = json.decode(response.body);
        final streams = formList.map((json) => FormModel.fromJson(json)).toList();
        emit(FormLoaded(streams));
      } catch (error) {
        emit(FormError(error.toString()));
      }
    });
    on<FormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access') ?? '';
  }
  
}
