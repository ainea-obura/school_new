import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:school_new/presentation/login_vtwo_screen/models/login_vtwo_model.dart';
part 'login_vtwo_event.dart';
part 'login_vtwo_state.dart';

/// A bloc that manages the state of a LoginVtwo according to the event that is dispatched to it.
class LoginVtwoBloc extends Bloc<LoginVtwoEvent, LoginVtwoState> {
  LoginVtwoBloc(LoginVtwoState initialState) : super(initialState) {
    on<LoginVtwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LoginVtwoInitialEvent event,
    Emitter<LoginVtwoState> emit,
  ) async {}
}
