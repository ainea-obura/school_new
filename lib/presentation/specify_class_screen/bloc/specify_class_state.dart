// ignore_for_file: must_be_immutable

part of 'specify_class_bloc.dart';

/// Represents the state of SpecifyClass in the application.
class SpecifyClassState extends Equatable {
  SpecifyClassState({
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.specifyClassModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SpecifyClassModel? specifyClassModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        specifyClassModelObj,
      ];

  SpecifyClassState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SpecifyClassModel? specifyClassModelObj,
  }) {
    return SpecifyClassState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      specifyClassModelObj: specifyClassModelObj ?? this.specifyClassModelObj,
    );
  }
}
