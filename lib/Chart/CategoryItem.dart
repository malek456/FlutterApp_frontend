import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  final String svgPath;
  final String label;
  final VoidCallback onTap;

  const CategoryItem({
    Key? key,
    required this.svgPath,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate on tap
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 9.4, 7.2),
            child: SizedBox(
              width: 75,
              height: 49.8,
              child: SvgPicture.asset(
                svgPath,
              ),
            ),
          ),
          SizedBox(
            width: 75, // Set a width to constrain the text
            child: Text(
              label,
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color(0xCC202244),
              ),
              maxLines: 2, // Set maximum number of lines to display
              overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
              textAlign: TextAlign.center, // Center align the text
            ),
          ),
        ],
      ),
    );
  }
}
