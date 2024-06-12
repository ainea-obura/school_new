// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:school_new/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [specify_class_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SpecifyClassModel extends Equatable {
  SpecifyClassModel({
    this.dropdownItemList = const [],
    this.dropdownItemList1 = const [],
  }) {}

  List<SelectionPopupModel> dropdownItemList;

  List<SelectionPopupModel> dropdownItemList1;

  SpecifyClassModel copyWith({
    List<SelectionPopupModel>? dropdownItemList,
    List<SelectionPopupModel>? dropdownItemList1,
  }) {
    return SpecifyClassModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
      dropdownItemList1: dropdownItemList1 ?? this.dropdownItemList1,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList, dropdownItemList1];
}
