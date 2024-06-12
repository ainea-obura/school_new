class Student {
  final int id;
  final String uuid;
  final String fname;
  final String lname; 
  final String admNo;
  final int userId;
  final int form;
  dynamic stream;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  Student({
    required this.id,
    required this.uuid,
    required this.fname,
    required this.lname,
    required this.admNo,
    required this.userId,
    required this.form,
    this.stream,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      uuid: json['uuid'],
      fname: json['fname'],
      lname: json['lname'],
      admNo:json['adm_no'],
      userId: json['user_id'],
      form: json['class'],
      stream: json['stream'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
