import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled4/Chart/Chart.dart';
import 'package:untitled4/models/CategoryCourse.dart';

class Courselistitem extends StatelessWidget {
  final Categorycourse category;
  final String title;
  final List<String> images;
  final String? status;
  final VoidCallback onTap;

  const Courselistitem({
    Key? key,
    required this.category,
    required this.title,
    required this.images,
    required this.status,
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
              color: Colors.black,
              child: Container(
                height: 150,
                child: images.isEmpty
                    ? Placeholder() // Placeholder for images if empty
                    : Image.network(
                  images.first, // Display the first image (customize as needed)
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
                      title,
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
                    category.title, // Assuming category has a 'title' property
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    status!, // Assuming category has a 'title' property
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonColor),
                    child: Text(
                        'View Details',
                        style: TextStyle(color: Colors.white),
                    ),
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
