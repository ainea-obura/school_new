part of 'subject_bloc.dart';

sealed class SubjectState extends Equatable {
  const SubjectState();
  
  @override
  List<Object> get props => [];
}

final class SubjectInitial extends SubjectState {}

class SubjectLoading extends SubjectState {}

class SubjectLoaded extends SubjectState {
  final List<SubjectModel> subjects;

  const SubjectLoaded(this.subjects);

  @override
  List<Object> get props => [subjects];
}

class SubjectError extends SubjectState {
  final String error;

  const SubjectError(this.error);

  @override
  List<Object> get props => [error];
}