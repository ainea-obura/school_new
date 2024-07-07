// To parse this JSON data, do
//
//     final formModel = formModelFromJson(jsonString);

import 'dart:convert';

List<FormModel> formModelFromJson(String str) => List<FormModel>.from(json.decode(str).map((x) => FormModel.fromJson(x)));

String formModelToJson(List<FormModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FormModel {
    int id;
    String name;

    FormModel({
        required this.id,
        required this.name,
    });

    factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
