// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

List<BookModel> bookModelFromJson(String str) => List<BookModel>.from(json.decode(str).map((x) => BookModel.fromJson(x)));

String bookModelToJson(List<BookModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookModel {
    int id;
    String bookTitle;
    int form;
    int subject;

    BookModel({
        required this.id,
        required this.bookTitle,
        required this.form,
        required this.subject,
    });

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        bookTitle: json["book_title"],
        form: json["form"],
        subject: json["subject"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "book_title": bookTitle,
        "form": form,
        "subject": subject,
    };
}


// class BookModel {
//   final int id;
//   final String uuid;
//   final String name;
//   final int userId;
//   final  int subjectId;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   BookModel({
//     required this.id,
//     required this.uuid,
//     required this.name,
//     required this.userId,
//     required this.subjectId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory BookModel.fromJson(Map<String, dynamic> json) {
//     return BookModel(
//       id: json['id'],
//       uuid: json['uuid'],
//       name: json['name'],
//       userId: json['user_id'],
//       subjectId: json['subject_id'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }
// }
