// ignore_for_file: must_be_immutable

part of 'assign_book_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AssignBookOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AssignBookOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the AssignBookOne widget is first created.
class AssignBookOneInitialEvent extends AssignBookOneEvent {
  @override
  List<Object?> get props => [];
}
