// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

List<SubjectModel> subjectModelFromJson(String str) => List<SubjectModel>.from(json.decode(str).map((x) => SubjectModel.fromJson(x)));

String subjectModelToJson(List<SubjectModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectModel {
    int id;
    String name;

    SubjectModel({
        required this.id,
        required this.name,
    });

    factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}


// class SubjectModel {
//   final int id;
//   final String uuid;
//   final String name;
//   final int userId;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   SubjectModel({
//     required this.id,
//     required this.uuid,
//     required this.name,
//     required this.userId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory SubjectModel.fromJson(Map<String, dynamic> json) {
//     return SubjectModel(
//       id: json['id'],
//       uuid: json['uuid'],
//       name: json['name'],
//       userId: json['user_id'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }
// }
