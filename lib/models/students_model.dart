// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
    int id;
    String admNo;
    String firstName;
    String lastName;
    dynamic dob;
    int form;
    int stream;
    dynamic medicalCondition;
    dynamic role;
    dynamic clubsAndSociety;
    dynamic sports;
    dynamic image;
    List<Parent> parents;

    Student({
        required this.id,
        required this.admNo,
        required this.firstName,
        required this.lastName,
        required this.dob,
        required this.form,
        required this.stream,
        required this.medicalCondition,
        required this.role,
        required this.clubsAndSociety,
        required this.sports,
        required this.image,
        required this.parents,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        admNo: json["adm_no"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dob: json["dob"],
        form: json["form"],
        stream: json["stream"],
        medicalCondition: json["medical_condition"],
        role: json["role"],
        clubsAndSociety: json["clubs_and_society"],
        sports: json["sports"],
        image: json["image"],
        parents: List<Parent>.from(json["parents"].map((x) => Parent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "adm_no": admNo,
        "first_name": firstName,
        "last_name": lastName,
        "dob": dob,
        "form": form,
        "stream": stream,
        "medical_condition": medicalCondition,
        "role": role,
        "clubs_and_society": clubsAndSociety,
        "sports": sports,
        "image": image,
        "parents": List<dynamic>.from(parents.map((x) => x.toJson())),
    };
}

class Parent {
    int id;
    String parentFname;
    String parentLname;
    dynamic email;
    String phoneNumber;
    dynamic location;

    Parent({
        required this.id,
        required this.parentFname,
        required this.parentLname,
        required this.email,
        required this.phoneNumber,
        required this.location,
    });

    factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"],
        parentFname: json["parent_fname"],
        parentLname: json["parent_lname"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parent_fname": parentFname,
        "parent_lname": parentLname,
        "email": email,
        "phone_number": phoneNumber,
        "location": location,
    };
}


// class Student {
//   final int id;
//   final String uuid;
//   final String fname;
//   final String lname; 
//   final String admNo;
//   final int userId;
//   final int form;
//   dynamic stream;
//   // final DateTime createdAt;
//   // final DateTime updatedAt;

//   Student({
//     required this.id,
//     required this.uuid,
//     required this.fname,
//     required this.lname,
//     required this.admNo,
//     required this.userId,
//     required this.form,
//     this.stream,
//     // required this.createdAt,
//     // required this.updatedAt,
//   });

//   factory Student.fromJson(Map<String, dynamic> json) {
//     return Student(
//       id: json['id'],
//       uuid: json['uuid'],
//       fname: json['fname'],
//       lname: json['lname'],
//       admNo:json['adm_no'],
//       userId: json['user_id'],
//       form: json['class'],
//       stream: json['stream'],
//       // createdAt: DateTime.parse(json['created_at']),
//       // updatedAt: DateTime.parse(json['updated_at']),
//     );
//   }
// }
