import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonButton extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final VoidCallback onTap;


  LessonButton({required this.number, required this.title, required this.description,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      //padding: const EdgeInsets.only(left: 15.0, top: 8.0, bottom: 8.0, right: 8.0), // Adjust padding as needed
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFE6F0FF),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  color: Color(0xFF4257B2),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF232A60),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          /*Icon(
            Icons.play_circle_fill,
            color: Color(0xFF4257B2),
            size: 24,
          ),*/
        ],
      ),
    );
    //);
  }
}