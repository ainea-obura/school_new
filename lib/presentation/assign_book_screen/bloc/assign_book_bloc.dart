import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:school_new/presentation/assign_book_screen/models/assign_book_model.dart';
part 'assign_book_event.dart';
part 'assign_book_state.dart';

/// A bloc that manages the state of a AssignBook according to the event that is dispatched to it.
class AssignBookBloc extends Bloc<AssignBookEvent, AssignBookState> {
  AssignBookBloc(AssignBookState initialState) : super(initialState) {
    on<AssignBookInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AssignBookInitialEvent event,
    Emitter<AssignBookState> emit,
  ) async {}
}
