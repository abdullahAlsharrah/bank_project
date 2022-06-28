import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

@JsonSerializable()
class User {
  int? id;
  String username;
  String password;

  User({this.id, required this.username, required this.password});

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  factory User.fromJson2(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}


//flutter pub run build_runner build
