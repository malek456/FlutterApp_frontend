import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled4/models/CategoryCourse.dart';
import 'package:untitled4/models/course.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/models/User.dart';
import '../models/trailer.dart';
import '../data/data.dart';



class ApiService {
  //final String baseUrl = 'http://192.168.1.95:5000/api';


  Future<List<Course>> fetchItems() async {
    final response = await http.get(Uri.parse('$baseUrl/courses/getAllCourses'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((course) => Course.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<Categorycourse>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories/'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map<Categorycourse>((json) => Categorycourse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }



  Future<bool> requestParticipation(String courseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('authToken'); // Retrieve the token

    if (token == null) {
      throw Exception('No authentication token found');
    }

    final url = '$baseUrl/participation/ParticipationRequest/$courseId';

    print('Sending participation request to URL: $url');

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({}),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error sending participation request: $e');
      throw Exception('Error sending participation request: $e');
    }
  }


  Future<String> getParticipation(String courseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('authToken'); // Retrieve the token

    if (token == null) {
      throw Exception('No authentication token found');
    }

    final url = '$baseUrl/courses/$courseId';
    print('Fetching participation data from URL: $url');

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final participation = data['isParticipated'];
        print('Participation status: $participation');
        return participation.toString();
      } else {
        print('Participation not found, status code: ${response.statusCode}');
        print('Error: ${response.body}');
        return 'Error: Failed to load participation status';
      }
    } catch (e) {
      print('Error: $e');
      return 'Error: $e';
    }
  }


  Future<AppUser?> getMentor(String courseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('authToken');

    if (token == null) {
      throw Exception('No authentication token found');
    }

    final url = '$baseUrl/courses/$courseId';
    print('Fetching mentors data from URL: $url');

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print('Response status code mentor: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print('we re trying to find the mentor');
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          final AppUser user = AppUser.fromJson(data['formateur']);
          print('Mentor status: $user');
          return user;
        } else {
          print('Unexpected JSON format: $data');
          return null;
        }
      } else {
        print('mentor not found, status code: ${response.statusCode}');
        print('Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('we re in catch now');
      print('Error: $e');
      return null;
    }
  }

  Future<List<Course>> getMentorCourses(String mentorId) async {
    final response = await http.get(
        Uri.parse('$baseUrl/courses/getAllCourses'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Course> courses = data.map((course) => Course.fromJson(course)).toList();

      List<Course> mentorCourses = [];
      for (Course course in courses) {
        if (course.mentor.id == mentorId) {
          mentorCourses.add(course);
        }
      }

      return mentorCourses;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<Course>> getCategoryCourses(String categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/courses/getAllCourses'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Course> courses = data.map((course) => Course.fromJson(course)).toList();

      List<Course> mentorCourses = [];
      for (Course course in courses) {
        if (course.category.id == categoryId) {
          mentorCourses.add(course);
        }
      }

      return mentorCourses;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<Trailer?> getTrailer(String courseId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('authToken');

    if (token == null) {
      throw Exception('No authentication token found');
    }

    final url = '$baseUrl/courses/$courseId';
    print('Fetching mentors data from URL: $url');

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print('Response status code mentor: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print('we re trying to find the trailer');
        final data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          final Trailer trailer = Trailer.fromJson(data['trailer']);
          print('Mentor status: $trailer');
          return trailer;
        } else {
          print('Unexpected JSON format: $data');
          return null;
        }
      } else {
        print('mentor not found, status code: ${response.statusCode}');
        print('Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('we re in catch now');
      print('Error: $e');
      return null;
    }
  }










}







