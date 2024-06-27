// To parse this JSON data, do
//
//     final streamModel = streamModelFromJson(jsonString);

import 'dart:convert';

List<StreamModel> streamModelFromJson(String str) => List<StreamModel>.from(json.decode(str).map((x) => StreamModel.fromJson(x)));

String streamModelToJson(List<StreamModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StreamModel {
    int id;
    String name;

    StreamModel({
        required this.id,
        required this.name,
    });

    factory StreamModel.fromJson(Map<String, dynamic> json) => StreamModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}


// class StreamModel {
//   final int id;
//   final String uuid;
//   final String name;
//   final int userId;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   StreamModel({
//     required this.id,
//     required this.uuid,
//     required this.name,
//     required this.userId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory StreamModel.fromJson(Map<String, dynamic> json) {
//     return StreamModel(
//       id: json['id'],
//       uuid: json['uuid'],
//       name: json['name'],
//       userId: json['user_id'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }
// }
