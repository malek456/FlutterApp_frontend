import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/Chart/Chart.dart';
import 'package:untitled4/screens/Category.dart';
import 'package:untitled4/screens/Courses_List.dart';
import 'package:untitled4/screens/MentorList.dart';
import 'package:untitled4/screens/MyCourses.dart';
import 'package:untitled4/screens/Profile.dart';
import 'package:untitled4/screens/mentorProfile.dart';
import '../Chart/GraphicDesignCard.dart';
import '../Chart/DynamicColorList.dart';
import '../Chart/Mentors.dart';
import '../Controllers/AuthService.dart';
import '../Controllers/ApiService.dart';
import '../models/User.dart';
import '../models/course.dart';
import 'CourseDetail.dart';
import 'SearchPage.dart';
import 'SignIn.dart';



class Home extends StatelessWidget {
  final AuthService _authService = AuthService();
  final ApiService _apiService = ApiService();
   Home({super.key, String? title});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: AppColors.backgroundColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
              ),
              child: Text(
                'SkillVortex',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()), // Navigate to CourseList page
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('course List'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoursesList()), // Navigate to CourseList page
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.book),
              title: Text('My courses'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mycourses()), // Navigate to CourseList page
                );

                // Navigate to Favorites
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                Navigator.pop(context);
                await _authService.logout();
                await _authService.logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
                // Handle logout
              },
            ),
          ],
        ),
      ),

      body: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(21, 12, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [



                Container(
                  margin: EdgeInsets.fromLTRB(14, 0, 0, 44),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Hello, ',
                                style: GoogleFonts.getFont(
                                  'Jost',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Color(0xFF202244),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'What Would you like to learn Today? ',
                            style: GoogleFonts.getFont(
                              'Mulish',
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Color(0xCC545454),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                //---------------------------Search field------------------------
                Padding(
                  padding: EdgeInsets.only(left:0, right: 16.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 8.0, right: 16.0),
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchPage()),
                        );
                      },
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.black),
                        hintText: 'Search for..',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      enabled: false ,
                      ),
                    ),
                    ),
                  ),
                ),
                //-----------------------------------------------------------
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.fromLTRB(14, 0, 20.4, 44),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: SizedBox(
                                width: 281.6,
                                child: Text(
                                  'Categories',
                                  style: GoogleFonts.getFont(
                                    'Jost',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Color(0xFF202244),
                                  ),
                                ),
                              ),
                            ),
                             InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Category()),
                                );
                              },
                            child:Container(
                              margin: EdgeInsets.fromLTRB(0, 6, 0, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      'SEE ALL',
                                      style: GoogleFonts.getFont(
                                        'Mulish',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 12,
                                        color: AppColors.buttonColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 2, 0, 3),
                                    child: SizedBox(
                                      width: 5,
                                      height: 10,
                                      child: SvgPicture.network(
                                        'assets/vectors/stroke_14_x2.svg',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                           ),
                          ],
                        ),
                      ),
                      DynamicColorList(),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 44),
                  child: SizedBox(
                    width: 580,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: 358,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                                    child: SizedBox(
                                      width: 281.6,
                                      child: Text(
                                        'Popular Courses',
                                        style: GoogleFonts.getFont(
                                          'Jost',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: AppColors.title,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => CoursesList()),
                                      );
                                    },

                                  child:Container(
                                    margin: EdgeInsets.fromLTRB(0, 6, 0, 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Text(
                                            'SEE ALL',
                                            style: GoogleFonts.getFont(
                                              'Mulish',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 12,
                                              color: AppColors.buttonColor,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0, 2, 0, 3),
                                          child: SizedBox(
                                            width: 5,
                                            height: 10,
                                            child: SvgPicture.network(
                                              'assets/vectors/stroke_11_x2.svg',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                                ],
                              ),
                            ),
                          ),
                        ),
//----------------------------------------------------------------------------------
                        Container(
                          height: 250,
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
                                  scrollDirection: Axis.horizontal,
                                  itemCount: courseList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final card = courseList[index];
                                    return GraphicDesignCard(
                                      category: card.category,
                                      title: card.title,
                                      images: card.images.toList(), // Assuming images is a List<String> in Course
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
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(6, 0, 27, 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: SizedBox(
                                width: 281.6,
                                child: Text(
                                  'Mentors',
                                  style: GoogleFonts.getFont(
                                    'Jost',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: AppColors.title,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 6, 0, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Mentorlist()),
                                      );
                                    },
                                    child:Container(
                                      margin: EdgeInsets.fromLTRB(0, 6, 0, 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Text(
                                              'SEE ALL',
                                              style: GoogleFonts.getFont(
                                                'Mulish',
                                                fontWeight: FontWeight.w800,
                                                fontSize: 12,
                                                color: AppColors.buttonColor,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 2, 0, 3),
                                            child: SizedBox(
                                              width: 5,
                                              height: 10,
                                              child: SvgPicture.network(
                                                'assets/vectors/stroke_14_x2.svg',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 93,
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
                              Set<String> uniqueMentors = Set<String>();

                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final course = snapshot.data![index];

                                  return FutureBuilder<AppUser?>(
                                    future: _apiService.getMentor(course.id),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return SizedBox(width: 100);
                                      } else {
                                        AppUser? user = snapshot.data;

                                        if (user != null && !uniqueMentors.contains(user.id.toString()) && user.role == "formateur") {
                                          uniqueMentors.add(user.id.toString());

                                          // Fetch all courses associated with this mentor here
                                          Future<List<Course>> mentorCoursesFuture = _apiService.getMentorCourses(user.id);

                                          return Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Mentors(
                                              image: 'assets/vectors/person.svg',
                                              name: user.firstName,
                                              onTap: () {
                                                mentorCoursesFuture.then((mentorCourses) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => Mentorprofile(
                                                        mentorName: user.firstName,
                                                        courses: mentorCourses,
                                                      ),
                                                    ),
                                                  );
                                                });
                                              },
                                            ),
                                          );
                                        } else {
                                          // Return empty container for mentors not meeting the criteria
                                          return SizedBox(width: 100); // Placeholder width for non-mentor
                                        }
                                      }
                                    },
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                      //------------------------------------------------------------------------
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 21, 0),
                  width: 134,
                  height: 5,
                  child:
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE2E6EA),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      width: 134,
                      height: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}