// ignore_for_file: must_be_immutable

part of 'student_search_qr_code_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///StudentSearchQrCodeOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class StudentSearchQrCodeOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the StudentSearchQrCodeOne widget is first created.
class StudentSearchQrCodeOneInitialEvent extends StudentSearchQrCodeOneEvent {
  @override
  List<Object?> get props => [];
}
