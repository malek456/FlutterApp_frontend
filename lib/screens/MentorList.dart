import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/Chart/Chart.dart';
import 'package:untitled4/Controllers/ApiService.dart';
import 'package:untitled4/models/User.dart';
import 'package:untitled4/models/course.dart';
import 'package:untitled4/screens/mentorProfile.dart';

class Mentorlist extends StatelessWidget {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentors'),
        backgroundColor: AppColors.backgroundColor , // Adjust as per your app's design
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<List<Course>>(
          future: _apiService.fetchItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No courses found'));
            } else {
              Set<String> uniqueMentors = Set<String>();

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final course = snapshot.data![index];

                  return FutureBuilder<AppUser?>(
                    future: _apiService.getMentor(course.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(width: 100); // Placeholder width for loading state
                      } else {
                        AppUser? user = snapshot.data;

                        if (user != null && user.role == "formateur" && !uniqueMentors.contains(user.id.toString())) {
                          uniqueMentors.add(user.id.toString());
                          Future<List<Course>> mentorCoursesFuture = _apiService.getMentorCourses(user.id);


                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: GestureDetector(
                              onTap: () {
                                mentorCoursesFuture.then((mentorCourses) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Mentorprofile(
                                        mentorName: user.firstName,
                                        courses: mentorCourses,
                                      ),
                                    ),
                                  );
                                });
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/vectors/person.svg', // Replace with your SVG path
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    user.firstName,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return SizedBox.shrink(); // Empty widget for non-mentor or already displayed mentor
                        }
                      }
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
