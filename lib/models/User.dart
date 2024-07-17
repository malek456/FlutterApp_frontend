import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  String id;
  String firstName;
  String lastName;
  String username;
  String gender;
  String email;
  String password;
  String phone;
  String role;

  AppUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.gender,
    required this.email,
    required this.password,
    required this.phone,
    required this.role,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['_id'] ?? 'Unknown',
      firstName: json['firstName'] ?? 'Unknown',
      lastName: json['lastName'] ?? 'Unknown',
      username: json['username'] ?? 'Unknown',
      gender: json['gender'] ?? 'Unknown',
      email: json['email'] ?? 'Unknown',
      password: json['password'] ?? 'Unknown',
      phone: json['phone'] ?? '0',
      role: json['role'] ?? 'Unknown',
    );
  }




}
