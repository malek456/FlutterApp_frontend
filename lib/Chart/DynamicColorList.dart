import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/CategoryCourse.dart';
import '../Controllers/ApiService.dart';


final ApiService _apiService = ApiService();
class DynamicColorList extends StatefulWidget {

  @override
  _DynamicColorListState createState() => _DynamicColorListState();
}

class _DynamicColorListState extends State<DynamicColorList> {
  int selectedIndex = 0; // Track the index of the selected item

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Categorycourse>>(
      future: _apiService.fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print("errooooor");
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No categories found'));
        } else {
          List<Categorycourse> categories = snapshot.data!;
          return Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: categories.asMap().entries.map((entry) {
                  int idx = entry.key;
                  Categorycourse category = entry.value;
                  return buildItem(idx, category.title, Color(0xFF656569));
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildItem(int index, String text, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // Update selected index on tap
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22.0), // Adjust horizontal margin as needed
        child: Text(
          text,
          style: GoogleFonts.getFont(
            'Mulish',
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: index == selectedIndex ? Color(0xFF656569) : color,
          ),
        ),
      ),
    );
  }
}
