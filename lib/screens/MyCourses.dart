import 'package:flutter/material.dart';
import 'package:untitled4/Chart/Chart.dart';
import 'package:untitled4/Controllers/ApiService.dart';
import '../Chart/CourseListItem.dart';
import '../models/course.dart';
import 'CourseDetail.dart';



class Mycourses extends StatelessWidget {
  final ApiService _apiService = ApiService();
  Mycourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: AppColors.backgroundColor,
      ),

      body: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: Container(
            padding: EdgeInsets.fromLTRB(25, 12, 14.3, 48),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //----------------------------------------------------------
                      SizedBox(height: 20),


              Container(
                height: 650,
                child: FutureBuilder<List<Course>>(
                  future: _apiService.fetchItems(),
                  builder: (context, AsyncSnapshot<List<Course>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No courses found'));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final course = snapshot.data![index];
                          return FutureBuilder<String?>(
                            future: _apiService.getParticipation(course.id),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Container(); // Placeholder until future completes
                              } else {
                                String? isParticipated = snapshot.data;
                                if (isParticipated == "approved" || isParticipated=='pending') {
                                  return Courselistitem(
                                    category: course.category,
                                    title: course.title,
                                    images: course.images.toList(),
                                    status: isParticipated,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Coursedetail(categoryTitle: course.category.title, course: course),
                                        ),
                                      );
                                    },
                                  );

                                } else {
                                  // Handle other states or conditions if needed
                                  return Container();
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}