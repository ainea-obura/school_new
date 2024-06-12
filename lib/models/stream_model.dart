class StreamModel {
  final int id;
  final String uuid;
  final String name;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  StreamModel({
    required this.id,
    required this.uuid,
    required this.name,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StreamModel.fromJson(Map<String, dynamic> json) {
    return StreamModel(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
