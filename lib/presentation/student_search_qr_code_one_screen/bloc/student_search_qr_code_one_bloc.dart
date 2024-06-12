import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:school_new/presentation/student_search_qr_code_one_screen/models/student_search_qr_code_one_model.dart';
part 'student_search_qr_code_one_event.dart';
part 'student_search_qr_code_one_state.dart';

/// A bloc that manages the state of a StudentSearchQrCodeOne according to the event that is dispatched to it.
class StudentSearchQrCodeOneBloc
    extends Bloc<StudentSearchQrCodeOneEvent, StudentSearchQrCodeOneState> {
  StudentSearchQrCodeOneBloc(StudentSearchQrCodeOneState initialState)
      : super(initialState) {
    on<StudentSearchQrCodeOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    StudentSearchQrCodeOneInitialEvent event,
    Emitter<StudentSearchQrCodeOneState> emit,
  ) async {}
}
