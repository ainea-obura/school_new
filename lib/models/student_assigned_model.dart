// To parse this JSON data, do
//
//     final studentAssignedModel = studentAssignedModelFromJson(jsonString);

import 'dart:convert';

List<StudentAssignedModel> studentAssignedModelFromJson(String str) => List<StudentAssignedModel>.from(json.decode(str).map((x) => StudentAssignedModel.fromJson(x)));

String studentAssignedModelToJson(List<StudentAssignedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentAssignedModel {
    int id;
    int student;
    int book;
    String bookNo;
    String bookTitle;
    DateTime assignedDate;
    String status;
    dynamic returnedDate;
    int school;

    StudentAssignedModel({
        required this.id,
        required this.student,
        required this.book,
        required this.bookNo,
        required this.bookTitle,
        required this.assignedDate,
        required this.status,
        required this.returnedDate,
        required this.school,
    });

    factory StudentAssignedModel.fromJson(Map<String, dynamic> json) => StudentAssignedModel(
        id: json["id"],
        student: json["student"],
        book: json["book"],
        bookNo: json["book_no"],
        bookTitle: json["book_title"],
        assignedDate: DateTime.parse(json["assigned_date"]),
        status: json["status"],
        returnedDate: json["returned_date"],
        school: json["school"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student": student,
        "book": book,
        "book_no": bookNo,
        "book_title": bookTitle,
        "assigned_date": "${assignedDate.year.toString().padLeft(4, '0')}-${assignedDate.month.toString().padLeft(2, '0')}-${assignedDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "returned_date": returnedDate,
        "school": school,
    };
}


