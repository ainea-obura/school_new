// ignore_for_file: must_be_immutable

part of 'student_search_results_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///StudentSearchResults widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class StudentSearchResultsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the StudentSearchResults widget is first created.
class StudentSearchResultsInitialEvent extends StudentSearchResultsEvent {
  @override
  List<Object?> get props => [];
}
