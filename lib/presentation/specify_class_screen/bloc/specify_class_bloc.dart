import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:school_new/presentation/specify_class_screen/models/specify_class_model.dart';
part 'specify_class_event.dart';
part 'specify_class_state.dart';

/// A bloc that manages the state of a SpecifyClass according to the event that is dispatched to it.
class SpecifyClassBloc extends Bloc<SpecifyClassEvent, SpecifyClassState> {
  SpecifyClassBloc(SpecifyClassState initialState) : super(initialState) {
    on<SpecifyClassInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
  }

  _onInitialize(
    SpecifyClassInitialEvent event,
    Emitter<SpecifyClassState> emit,
  ) async {
    emit(state.copyWith(
        specifyClassModelObj: state.specifyClassModelObj?.copyWith(
            dropdownItemList: fillDropdownItemList(),
            dropdownItemList1: fillDropdownItemList1())));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<SpecifyClassState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<SpecifyClassState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }
}
