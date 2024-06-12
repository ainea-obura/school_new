// ignore_for_file: must_be_immutable

part of 'login_vtwo_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LoginVtwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoginVtwoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the LoginVtwo widget is first created.
class LoginVtwoInitialEvent extends LoginVtwoEvent {
  @override
  List<Object?> get props => [];
}
