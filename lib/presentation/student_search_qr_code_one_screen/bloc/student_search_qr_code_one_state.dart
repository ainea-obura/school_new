// ignore_for_file: must_be_immutable

part of 'student_search_qr_code_one_bloc.dart';

/// Represents the state of StudentSearchQrCodeOne in the application.
class StudentSearchQrCodeOneState extends Equatable {
  StudentSearchQrCodeOneState({this.studentSearchQrCodeOneModelObj});

  StudentSearchQrCodeOneModel? studentSearchQrCodeOneModelObj;

  @override
  List<Object?> get props => [
        studentSearchQrCodeOneModelObj,
      ];

  StudentSearchQrCodeOneState copyWith(
      {StudentSearchQrCodeOneModel? studentSearchQrCodeOneModelObj}) {
    return StudentSearchQrCodeOneState(
      studentSearchQrCodeOneModelObj:
          studentSearchQrCodeOneModelObj ?? this.studentSearchQrCodeOneModelObj,
    );
  }
}
