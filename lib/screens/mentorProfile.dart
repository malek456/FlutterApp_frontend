import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/Chart/Chart.dart';
import 'package:untitled4/Chart/LessonButton.dart';
import 'package:untitled4/models/course.dart';
import 'CourseDetail.dart';

class Mentorprofile extends StatelessWidget {
  final String? mentorName;
  final List<Course> courses;

  const Mentorprofile({Key? key, required this.mentorName, required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor Profile'),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue[200],
            child: SvgPicture.asset(
              'assets/vectors/person.svg',
              width: 80,
              height: 80,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            mentorName ?? '',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return LessonButton(
                  title: course.title,
                  description:course.category.title,
                  number: index+1,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Coursedetail(categoryTitle: course.category.title, course: course),
                      ),
                    );
                  },               );
              },
            ),
          ),
        ],
      ),
    );
  }
}
