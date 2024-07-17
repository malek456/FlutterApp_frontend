import 'package:flutter/material.dart';
import 'package:untitled4/Controllers/ApiService.dart';
import 'package:untitled4/screens/Category_List.dart';
import '../Chart/Chart.dart';
import '../Chart/CategoryItem.dart';
import '../models/CategoryCourse.dart';




class Category extends StatelessWidget {
  ApiService _apiService =ApiService();
   Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("categories"),
      backgroundColor: AppColors.backgroundColor,
    ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 70, 5, 0),

        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
        ),


        child: FutureBuilder<List<Categorycourse>>(
          future: _apiService.fetchCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print("error");
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No categories found'));
            } else {
              List<Categorycourse> categories = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  Categorycourse category = categories[index];
                  return CategoryItem(
                    svgPath: 'assets/vectors/icon_11_x2.svg', // Replace with category.image if available
                    label: category.title,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryList(category: category),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },//
        ),
        ),
      );
  }
}