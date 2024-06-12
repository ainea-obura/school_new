class BookModel {
  final int id;
  final String uuid;
  final String name;
  final int userId;
  final  int subjectId;
  final DateTime createdAt;
  final DateTime updatedAt;

  BookModel({
    required this.id,
    required this.uuid,
    required this.name,
    required this.userId,
    required this.subjectId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      userId: json['user_id'],
      subjectId: json['subject_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
