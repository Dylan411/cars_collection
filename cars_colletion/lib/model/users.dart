import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

Users mongoDBFromJson(String str) => Users.fromJson(jsonDecode(str));
String mongoDBtoJson(Users data) => jsonEncode(data.toJson());

class Users {
  Users({
    required this.id,
    required this.userName,
    required this.password,
    required this.cars,
  });

  ObjectId id;
  String userName;
  String password;
  Object cars;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      id: json["_id"],
      userName: json["UserName"],
      password: json["Password"],
      cars: json["Cars"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "UserName": userName,
        "Password": password,
        "Cars": cars,
      };
}
