// ignore_for_file: must_be_immutable

part of 'assign_book_one_bloc.dart';

/// Represents the state of AssignBookOne in the application.
class AssignBookOneState extends Equatable {
  AssignBookOneState({this.assignBookOneModelObj});

  AssignBookOneModel? assignBookOneModelObj;

  @override
  List<Object?> get props => [
        assignBookOneModelObj,
      ];

  AssignBookOneState copyWith({AssignBookOneModel? assignBookOneModelObj}) {
    return AssignBookOneState(
      assignBookOneModelObj:
          assignBookOneModelObj ?? this.assignBookOneModelObj,
    );
  }
}
