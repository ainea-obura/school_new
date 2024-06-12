part of 'student_bloc.dart';

sealed class StudentState extends Equatable {
  const StudentState();
  
  @override
  List<Object> get props => [];
}

final class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  final List<Student> students;

  const StudentLoaded({required this.students});

  @override
  List<Object> get props => [students];
}

class StudentError extends StudentState {
  final String error;

  const StudentError(this.error);

  @override
  List<Object> get props => [error];
}