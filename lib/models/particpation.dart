import 'package:flutter/foundation.dart';
import 'package:untitled4/models/course.dart';

class Participation {
  String id;
  Course course;
  String approved;

  Participation({
    required this.id,
    required this.course,
    required this.approved,
  });

  factory Participation.fromJson(Map<String, dynamic> json) {
    return Participation(
      id: json['_id'] ?? '',
      course: Course.fromJson(json['course'] ?? {}),
      approved: json['approved'] ?? 'Unknown',
    );
  }
}
