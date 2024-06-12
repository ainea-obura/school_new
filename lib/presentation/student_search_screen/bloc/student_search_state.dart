// ignore_for_file: must_be_immutable

part of 'student_search_bloc.dart';

/// Represents the state of StudentSearch in the application.
class StudentSearchState extends Equatable {
  StudentSearchState({this.studentSearchModelObj});

  StudentSearchModel? studentSearchModelObj;

  @override
  List<Object?> get props => [
        studentSearchModelObj,
      ];

  StudentSearchState copyWith({StudentSearchModel? studentSearchModelObj}) {
    return StudentSearchState(
      studentSearchModelObj:
          studentSearchModelObj ?? this.studentSearchModelObj,
    );
  }
}
