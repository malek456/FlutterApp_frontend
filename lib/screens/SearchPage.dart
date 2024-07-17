import 'package:flutter/material.dart';
import 'package:untitled4/Controllers/ApiService.dart';
import 'package:untitled4/models/course.dart';
import 'package:untitled4/screens/CourseDetail.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ApiService _apiService = ApiService();
  TextEditingController _searchController = TextEditingController();
  List<Course> _allCourses = [];
  List<Course> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _fetchCourses();
    _searchController.addListener(_filterItems);
  }
  void _fetchCourses() async {
    try {
      List<Course> courses = await _apiService.fetchItems();
      setState(() {
        _allCourses = courses;
        _filteredCourses = courses;
      });
    } catch (e) {
      print('Error fetching courses: $e');
      // Handle error state if necessary
    }
  }

  void _filterItems() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      _filteredCourses = _allCourses.where((course) =>
          course.title.toLowerCase().contains(searchText)).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Page')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: _filteredCourses.isEmpty
                ? Center(child: Text('No courses found'))
                : ListView.builder(
              itemCount: _filteredCourses.length,
              itemBuilder: (context, index) {
                Course course = _filteredCourses[index];

                // Check if the previous course has the same category title
                bool showCategoryTitle =
                    index == 0 || course.category.title != _filteredCourses[index - 1].category.title;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showCategoryTitle)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Text(
                          course.category.title,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Coursedetail(course: course, categoryTitle: course.category.title),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(course.title),
                      ),
                    ),
                    //Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
