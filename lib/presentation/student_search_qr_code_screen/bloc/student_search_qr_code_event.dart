// ignore_for_file: must_be_immutable

part of 'student_search_qr_code_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///StudentSearchQrCode widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class StudentSearchQrCodeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the StudentSearchQrCode widget is first created.
class StudentSearchQrCodeInitialEvent extends StudentSearchQrCodeEvent {
  @override
  List<Object?> get props => [];
}
