// ignore_for_file: must_be_immutable

part of 'student_search_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///StudentSearch widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class StudentSearchEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the StudentSearch widget is first created.
class StudentSearchInitialEvent extends StudentSearchEvent {
  @override
  List<Object?> get props => [];
}
