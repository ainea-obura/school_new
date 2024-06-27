// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String refresh;
    String access;

    User({
        required this.refresh,
        required this.access,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        refresh: json["refresh"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
    };
}


// // To parse this JSON data, do
// //
// //     final user = userFromJson(jsonString);

// import 'dart:convert';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

// class User {
//     UserClass user;
//     String accessToken;

//     User({
//         required this.user,
//         required this.accessToken,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         user: UserClass.fromJson(json["user"]),
//         accessToken: json["access_token"],
//     );

//     Map<String, dynamic> toJson() => {
//         "user": user.toJson(),
//         "access_token": accessToken,
//     };
// }

// class UserClass {
//     int id;
//     String uuid;
//     String name;
//     String email;
//     dynamic emailVerifiedAt;
//     DateTime createdAt;
//     DateTime updatedAt;

//     UserClass({
//         required this.id,
//         required this.uuid,
//         required this.name,
//         required this.email,
//         required this.emailVerifiedAt,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
//         id: json["id"],
//         uuid: json["uuid"],
//         name: json["name"],
//         email: json["email"],
//         emailVerifiedAt: json["email_verified_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "uuid": uuid,
//         "name": name,
//         "email": email,
//         "email_verified_at": emailVerifiedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }
