import '../../../core/app_export.dart';

/// This class is used in the [eleven_item_widget] screen.
class ElevenItemModel {
  ElevenItemModel({
    this.assignBooksImage,
    this.playQuizText,
    this.id,
  }) {
    assignBooksImage = assignBooksImage ?? ImageConstant.imgTelevision;
    playQuizText = playQuizText ?? "Assign Books ";
    id = id ?? "";
  }

  String? assignBooksImage;

  String? playQuizText;

  String? id;
}
