import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/models/CategoryCourse.dart';

import '../models/category_model.dart';

class GraphicDesignCard extends StatelessWidget {
  final Categorycourse category;
  final String title;
  final List<String> images;
  final VoidCallback onTap;

  const GraphicDesignCard({
    Key? key,
    required this.category,
    required this.title,
    required this.images,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 250, // Width of the card
        height: 211, // Height of the card
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: images.isNotEmpty
                      ? Image.network(
                    images[0], // Display the first image from the list
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                      : Placeholder(), // Placeholder if images list is empty
                ),
              ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category.title ,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '4.2',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.green,
                      size: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
