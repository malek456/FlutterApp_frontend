import 'package:flutter/material.dart';
import 'package:untitled4/Chart/Chart.dart';
import 'package:untitled4/Controllers/ApiService.dart';
import '../Chart/CourseListItem.dart';
import '../models/course.dart';
import 'CourseDetail.dart';



class CoursesList extends StatelessWidget {
  final ApiService _apiService = ApiService();
   CoursesList({super.key});

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
//-----------------------------------Search Button----------------------------------------------------
                   /* SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left:0, right: 16.0), // Custom left padding
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0, right: 16.0), // Custom left padding
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Colors.black),
                            hintText: 'Search for..',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),*/




                    SizedBox(height: 10),
                    Container(
                      height: 700,
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