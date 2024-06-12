import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../models/user_model.dart';
import '../../../repositories/login_repository.dart';
import '/core/app_export.dart';
//import 'package:school_new/presentation/login_screen/models/login_model.dart';
part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc(LoginState initialState) : super(initialState) {
//     on<LoginInitialEvent>(_onInitialize);
//   }

//   _onInitialize(
//     LoginInitialEvent event,
//     Emitter<LoginState> emit,
//   ) async {
//     Future.delayed(const Duration(milliseconds: 3000), () {
//       NavigatorService.popAndPushNamed(
//         AppRoutes.dashboardScreen,
//       );
//     });
//   }
// }

// login_bloc.dart
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;

  LoginBloc(this._repository) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await _repository.login(event.email, event.password);
        emit(LoginSuccess(user));
      } catch (error) {
        emit(LoginFailure(error.toString()));
      }
    });
  }
}

