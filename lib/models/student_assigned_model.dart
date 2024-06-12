class StudentAssignedModel {
  final int id;
  final String uuid;
  final String bookName;
  final String bookNo;
  final int userId;
  final int studentId;
  final int assigned;
  final DateTime createdAt;
  final DateTime updatedAt;

  StudentAssignedModel({
    required this.id,
    required this.uuid,
    required this.bookName,
    required this.bookNo,
    required this.userId,
    required this.studentId,
    required this.assigned,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentAssignedModel.fromJson(Map<String, dynamic> json) {
    return StudentAssignedModel(
      id: json['id'],
      uuid: json['uuid'],
      bookName: json['book_name'],
      bookNo: json['book_no'],
      userId: json['user_id'],
      studentId: json['student_id'],
      assigned: json['assigned'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
