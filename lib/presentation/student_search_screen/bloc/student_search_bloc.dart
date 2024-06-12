import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:school_new/presentation/student_search_screen/models/student_search_model.dart';
part 'student_search_event.dart';
part 'student_search_state.dart';

/// A bloc that manages the state of a StudentSearch according to the event that is dispatched to it.
class StudentSearchBloc extends Bloc<StudentSearchEvent, StudentSearchState> {
  StudentSearchBloc(StudentSearchState initialState) : super(initialState) {
    on<StudentSearchInitialEvent>(_onInitialize);
  }

  _onInitialize(
    StudentSearchInitialEvent event,
    Emitter<StudentSearchState> emit,
  ) async {}
}
