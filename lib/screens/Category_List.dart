import 'package:flutter/material.dart';
import 'package:untitled4/Chart/Chart.dart';
import 'package:untitled4/Controllers/ApiService.dart';
import 'package:untitled4/models/CategoryCourse.dart';
import '../Chart/CourseListItem.dart';
import '../models/course.dart';
import 'CourseDetail.dart';



class CategoryList extends StatelessWidget {
  final Categorycourse category;
  final ApiService _apiService = ApiService();
  CategoryList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('categories'),
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

//------------------------------------Search Button----------------------------------------------------

                      //-----------------------------------------------------------------------


                      SizedBox(height: 50),
                      Container(
                        height: 600,
                        child: FutureBuilder<List<Course>>(
                          future: _apiService.getCategoryCourses(category.id),
                          builder: (context, AsyncSnapshot<List<Course>> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(child: Text('No courses found'));
                            } else {
                              List<Course> courseList = snapshot.data!;
                              return ListView.builder(
                                padding: const EdgeInsets.all(8),
                                scrollDirection: Axis.vertical,
                                itemCount: courseList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final card = courseList[index];
                                  return Courselistitem(
                                    category: card.category,
                                    title: card.title,
                                    images: card.images.toList(),
                                    status: '',// Assuming images is a List<String> in Course
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Coursedetail(categoryTitle: card.category.title, course: card),
                                        ),
                                      );
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