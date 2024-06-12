// ignore_for_file: must_be_immutable

part of 'assign_book_bloc.dart';

/// Represents the state of AssignBook in the application.
class AssignBookState extends Equatable {
  AssignBookState({this.assignBookModelObj});

  AssignBookModel? assignBookModelObj;

  @override
  List<Object?> get props => [
        assignBookModelObj,
      ];

  AssignBookState copyWith({AssignBookModel? assignBookModelObj}) {
    return AssignBookState(
      assignBookModelObj: assignBookModelObj ?? this.assignBookModelObj,
    );
  }
}
