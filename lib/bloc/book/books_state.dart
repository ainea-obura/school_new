part of 'books_bloc.dart';

sealed class BooksState extends Equatable {
  const BooksState();
  
  @override
  List<Object> get props => [];
}

final class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final List<BookModel> books;

  const BooksLoaded(this.books);

  @override
  List<Object> get props => [books];
}

class BooksError extends BooksState {
  final String error;

  const BooksError(this.error);

  @override
  List<Object> get props => [error];
}