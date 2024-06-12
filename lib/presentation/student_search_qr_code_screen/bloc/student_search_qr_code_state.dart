// ignore_for_file: must_be_immutable

part of 'student_search_qr_code_bloc.dart';

/// Represents the state of StudentSearchQrCode in the application.
class StudentSearchQrCodeState extends Equatable {
  StudentSearchQrCodeState({this.studentSearchQrCodeModelObj});

  StudentSearchQrCodeModel? studentSearchQrCodeModelObj;

  @override
  List<Object?> get props => [
        studentSearchQrCodeModelObj,
      ];

  StudentSearchQrCodeState copyWith(
      {StudentSearchQrCodeModel? studentSearchQrCodeModelObj}) {
    return StudentSearchQrCodeState(
      studentSearchQrCodeModelObj:
          studentSearchQrCodeModelObj ?? this.studentSearchQrCodeModelObj,
    );
  }
}
