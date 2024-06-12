// ignore_for_file: must_be_immutable

part of 'login_vtwo_bloc.dart';

/// Represents the state of LoginVtwo in the application.
class LoginVtwoState extends Equatable {
  LoginVtwoState({this.loginVtwoModelObj});

  LoginVtwoModel? loginVtwoModelObj;

  @override
  List<Object?> get props => [
        loginVtwoModelObj,
      ];

  LoginVtwoState copyWith({LoginVtwoModel? loginVtwoModelObj}) {
    return LoginVtwoState(
      loginVtwoModelObj: loginVtwoModelObj ?? this.loginVtwoModelObj,
    );
  }
}
