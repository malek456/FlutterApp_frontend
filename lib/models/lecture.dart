
import 'package:flutter/foundation.dart';
import 'package:untitled4/models/CategoryCourse.dart';
import 'package:untitled4/models/attachments.dart';
import 'package:untitled4/models/category_model.dart';

class Lecture{
  String id;
  String description;
  String title ;
  Attachments attachments;


  Lecture({required this.id,required this.description,required this.title
    , required this.attachments});

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      id: json['_id']?? 0,
      title: json['description']?? 'Unknown',
      description: json['title']?? 'Unknown',
      attachments: Attachments.fromJson(json['attachments'] ?? {}),
    );
  }
}