import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../models/book_model.dart';
import 'books_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookLoading());

  Future<void> getBooks(int form, int subject) async {
    try {
       final token = await getTokenFromSharedPreferences();
      final response = await http.get(
        // Uri.parse('$baseUrl/api/books/all'),
        Uri.parse('$baseUrl/api/books/filter/?form=$form&subject=$subject'),
        headers: {'Authorization': 'Bearer $token', "accept": "application/json"},
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> bookList = jsonData;
        final books = bookList.map((json) => BookModel.fromJson(json)).toList();
        emit(BookLoaded(books));
      } else {
        emit(BookError('Failed to load books'));
      }
    } catch (e) {
      emit(BookError('Error: $e'));
    }
  }

  Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access') ?? '';
  }
}