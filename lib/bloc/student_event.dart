part of 'student_bloc.dart';

sealed class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object> get props => [];
}

class SearchStudent extends StudentEvent {
  final String query;

  const SearchStudent({required this.query});

  @override
  List<Object> get props => [query];
}