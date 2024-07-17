import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled4/models/CategoryCourse.dart';
import 'package:untitled4/models/course.dart';

class Participationlistitem extends StatelessWidget {
  final Course course;
  final String approved;
  final VoidCallback onTap;



  const Participationlistitem({
    Key? key,
    required this.course,
    required this.approved,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 20.2, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
              child: Container(
                height: 130,
                child: course.images.isEmpty
                    ? Placeholder() // Placeholder for images if empty
                    : Image.network(
                  course.images.first, // Display the first image (customize as needed)
                  width: double.infinity, // Full width
                  height: double.infinity, // Full height
                  fit: BoxFit.cover, // Cover the entire area
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 5.3, 0),
                    child: Text(
                      course.title,
                      style: GoogleFonts.getFont(
                        'Jost',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF202244),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    course.category.title, // Assuming category has a 'title' property
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                   approved, // Assuming category has a 'title' property
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800]),
                    child: Text(
                      'View Details',
                      style: TextStyle(color: Colors.white),
                    )
                    ,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
