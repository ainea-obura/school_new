import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:school_new/presentation/assign_book_one_screen/models/assign_book_one_model.dart';
part 'assign_book_one_event.dart';
part 'assign_book_one_state.dart';

/// A bloc that manages the state of a AssignBookOne according to the event that is dispatched to it.
class AssignBookOneBloc extends Bloc<AssignBookOneEvent, AssignBookOneState> {
  AssignBookOneBloc(AssignBookOneState initialState) : super(initialState) {
    on<AssignBookOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AssignBookOneInitialEvent event,
    Emitter<AssignBookOneState> emit,
  ) async {}
}
