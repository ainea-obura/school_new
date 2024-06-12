// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Represents the state of Login in the application.
// class LoginState extends Equatable {
//   LoginState({this.loginModelObj});

//   LoginModel? loginModelObj;

//   @override
//   List<Object?> get props => [
//         loginModelObj,
//       ];

//   LoginState copyWith({LoginModel? loginModelObj}) {
//     return LoginState(
//       loginModelObj: loginModelObj ?? this.loginModelObj,
//     );
//   }
  
// }
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}