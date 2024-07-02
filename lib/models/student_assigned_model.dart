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
    DateTime assignedDate;
    String status;
    dynamic returnedDate;
    int school;

    StudentAssignedModel({
        required this.id,
        required this.student,
        required this.book,
        required this.bookNo,
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
        "assigned_date": "${assignedDate.year.toString().padLeft(4, '0')}-${assignedDate.month.toString().padLeft(2, '0')}-${assignedDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "returned_date": returnedDate,
        "school": school,
    };
}


// class StudentAssignedModel {
//   final int id;
//   final String uuid;
//   final String bookName;
//   final String bookNo;
//   final int userId;
//   final int studentId;
//   final int assigned;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   StudentAssignedModel({
//     required this.id,
//     required this.uuid,
//     required this.bookName,
//     required this.bookNo,
//     required this.userId,
//     required this.studentId,
//     required this.assigned,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory StudentAssignedModel.fromJson(Map<String, dynamic> json) {
//     return StudentAssignedModel(
//       id: json['id'],
//       uuid: json['uuid'],
//       bookName: json['book_name'],
//       bookNo: json['book_no'],
//       userId: json['user_id'],
//       studentId: json['student_id'],
//       assigned: json['assigned'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }
// }
