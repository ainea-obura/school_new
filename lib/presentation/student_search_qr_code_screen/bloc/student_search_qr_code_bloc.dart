import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:school_new/presentation/student_search_qr_code_screen/models/student_search_qr_code_model.dart';
part 'student_search_qr_code_event.dart';
part 'student_search_qr_code_state.dart';

/// A bloc that manages the state of a StudentSearchQrCode according to the event that is dispatched to it.
class StudentSearchQrCodeBloc
    extends Bloc<StudentSearchQrCodeEvent, StudentSearchQrCodeState> {
  StudentSearchQrCodeBloc(StudentSearchQrCodeState initialState)
      : super(initialState) {
    on<StudentSearchQrCodeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    StudentSearchQrCodeInitialEvent event,
    Emitter<StudentSearchQrCodeState> emit,
  ) async {}
}
