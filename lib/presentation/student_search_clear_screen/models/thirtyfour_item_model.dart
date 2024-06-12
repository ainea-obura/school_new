import '../../../core/app_export.dart';

/// This class is used in the [thirtyfour_item_widget] screen.
class ThirtyfourItemModel {
  ThirtyfourItemModel({
    this.name,
    this.admNo,
    this.classVar,
    this.id,
  }) {
    name = name ?? "BRIAN MAINGI KAMAU";
    admNo = admNo ?? "Adm No: 1290";
    classVar = classVar ?? "Class: 4 North";
    id = id ?? "";
  }

  String? name;

  String? admNo;

  String? classVar;

  String? id;
}
