import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/eleven_item_model.dart';
import 'package:school_new/presentation/dashboard_screen/models/dashboard_model.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

/// A bloc that manages the state of a Dashboard according to the event that is dispatched to it.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(DashboardState initialState) : super(initialState) {
    on<DashboardInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DashboardInitialEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(
        dashboardModelObj: state.dashboardModelObj?.copyWith(
      elevenItemList: fillElevenItemList(),
    )));
  }

  List<ElevenItemModel> fillElevenItemList() {
    return [
      ElevenItemModel(
          assignBooksImage: ImageConstant.imgTelevision,
          playQuizText: "Assign Books "),
      ElevenItemModel(
          assignBooksImage: ImageConstant.imgTodoList,
          playQuizText: "Clear Books"),
      ElevenItemModel(
          assignBooksImage: ImageConstant.imgLocation,
          playQuizText: "Change Password"),
      ElevenItemModel(
          assignBooksImage: ImageConstant.imgUser, playQuizText: "Logout")
    ];
  }
}
