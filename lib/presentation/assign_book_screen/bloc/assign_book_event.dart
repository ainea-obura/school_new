// ignore_for_file: must_be_immutable

part of 'assign_book_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AssignBook widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AssignBookEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the AssignBook widget is first created.
class AssignBookInitialEvent extends AssignBookEvent {
  @override
  List<Object?> get props => [];
}
