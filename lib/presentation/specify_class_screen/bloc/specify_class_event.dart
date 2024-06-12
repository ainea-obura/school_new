// ignore_for_file: must_be_immutable

part of 'specify_class_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SpecifyClass widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SpecifyClassEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SpecifyClass widget is first created.
class SpecifyClassInitialEvent extends SpecifyClassEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends SpecifyClassEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends SpecifyClassEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
