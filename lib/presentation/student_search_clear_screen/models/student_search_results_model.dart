// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'thirtyfour_item_model.dart';

/// This class defines the variables used in the [student_search_results_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class StudentSearchResultsModel extends Equatable {
  StudentSearchResultsModel({this.thirtyfourItemList = const []}) {}

  List<ThirtyfourItemModel> thirtyfourItemList;

  StudentSearchResultsModel copyWith(
      {List<ThirtyfourItemModel>? thirtyfourItemList}) {
    return StudentSearchResultsModel(
      thirtyfourItemList: thirtyfourItemList ?? this.thirtyfourItemList,
    );
  }

  @override
  List<Object?> get props => [thirtyfourItemList];
}
