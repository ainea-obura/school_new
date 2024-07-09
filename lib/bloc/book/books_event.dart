part of 'books_bloc.dart';

sealed class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

// class LoadBooks extends BooksEvent {}

class LoadBooks extends BooksEvent {
  final int form;
  final int subject;

  const LoadBooks({required this.form, required this.subject});

  @override
  List<Object> get props => [form, subject];
}
