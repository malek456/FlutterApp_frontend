
import 'package:flutter/foundation.dart';
import 'package:untitled4/models/CategoryCourse.dart';
import 'package:untitled4/models/category_model.dart';
import 'package:untitled4/models/lecture.dart';

import 'User.dart';

class Course{
  String id;
  Categorycourse category;
  List<String> images;
  String title;
  String Price;
  List<Lecture>? lectures;
  AppUser mentor;

  Course(
      {
        required this.id,
        required this.category,
        required this.images,
        required this.title,
        required this.Price ,
        required this.lectures,
        required this.mentor,
      });


  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'] ?? 'Unknown',
      category: Categorycourse.fromJson(json['category'] ?? {}),
      images: List<String>.from(json['images'] ?? []),
      title: json['title'] ?? 'Unknown',
      Price: json['price'] ?? 'Unknown',
      lectures: (json['lectures'] as List<dynamic>? ?? []).map((e) => Lecture.fromJson(e as Map<String, dynamic>)).toList(),
      mentor: json['formateur'] != null ? AppUser.fromJson(json['formateur']) : AppUser(id: '', firstName: '', lastName: '', username: '', gender: '', email: '', password: '', phone: '', role: ''),
    );
  }

}