import 'package:flutter/material.dart';
import 'package:untitled4/models/course.dart';

class CourseProvider with ChangeNotifier {
  List<Course> _courses = [];

  List<Course> get courses => _courses;

  void addCourse(Course course) {
    _courses.add(course);
    notifyListeners();
  }

  void removeCourse(Course course) {
    _courses.remove(course);
    notifyListeners();
  }
}