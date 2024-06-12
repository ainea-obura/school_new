// ignore_for_file: must_be_immutable

part of 'student_search_results_bloc.dart';

/// Represents the state of StudentSearchResults in the application.
class StudentSearchResultsState extends Equatable {
  StudentSearchResultsState({this.studentSearchResultsModelObj});

  StudentSearchResultsModel? studentSearchResultsModelObj;

  @override
  List<Object?> get props => [
        studentSearchResultsModelObj,
      ];

  StudentSearchResultsState copyWith(
      {StudentSearchResultsModel? studentSearchResultsModelObj}) {
    return StudentSearchResultsState(
      studentSearchResultsModelObj:
          studentSearchResultsModelObj ?? this.studentSearchResultsModelObj,
    );
  }
}
