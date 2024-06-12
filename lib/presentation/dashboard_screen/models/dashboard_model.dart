// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'eleven_item_model.dart';

/// This class defines the variables used in the [dashboard_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel extends Equatable {
  DashboardModel({this.elevenItemList = const []}) {}

  List<ElevenItemModel> elevenItemList;

  DashboardModel copyWith({List<ElevenItemModel>? elevenItemList}) {
    return DashboardModel(
      elevenItemList: elevenItemList ?? this.elevenItemList,
    );
  }

  @override
  List<Object?> get props => [elevenItemList];
}
