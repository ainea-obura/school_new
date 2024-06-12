import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/thirtyfour_item_model.dart';
import 'package:school_new/presentation/student_search_clear_screen/models/student_search_results_model.dart';
part 'student_search_results_event.dart';
part 'student_search_results_state.dart';

/// A bloc that manages the state of a StudentSearchResults according to the event that is dispatched to it.
class StudentSearchResultsBloc
    extends Bloc<StudentSearchResultsEvent, StudentSearchResultsState> {
  StudentSearchResultsBloc(StudentSearchResultsState initialState)
      : super(initialState) {
    on<StudentSearchResultsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    StudentSearchResultsInitialEvent event,
    Emitter<StudentSearchResultsState> emit,
  ) async {
    emit(state.copyWith(
        studentSearchResultsModelObj: state.studentSearchResultsModelObj
            ?.copyWith(thirtyfourItemList: fillThirtyfourItemList())));
  }

  List<ThirtyfourItemModel> fillThirtyfourItemList() {
    return [
      ThirtyfourItemModel(
          name: "BRIAN MAINGI KAMAU",
          admNo: "Adm No: 1290",
          classVar: "Class: 4 North")
    ];
  }
}
