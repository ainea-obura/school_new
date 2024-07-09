import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../models/book_model.dart';
import 'package:http/http.dart' as http;

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksInitial()) {
    on<BooksEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadBooks>((event, emit) async {
      emit(BooksLoading());
      try {
        final token = await getTokenFromSharedPreferences();
        final form = event.form;
        final subject = event.subject;
        final response = await http.get(
        // Uri.parse('$baseUrl/api/books/all'),
        Uri.parse('$baseUrl/api/books/filter/?form=$form&subject=$subject'),
        headers: {'Authorization': 'Bearer $token', "accept": "application/json"},
      );

        print(response.body);

        // Assuming response is directly a list of Books
        final List<dynamic> booksList = json.decode(response.body);
        final books = booksList.map((json) => BookModel.fromJson(json)).toList();
        emit(BooksLoaded(books));
      } catch (error) {
        emit(BooksError(error.toString()));
      }
    });
  }

  Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access') ?? '';
  }
  
}
