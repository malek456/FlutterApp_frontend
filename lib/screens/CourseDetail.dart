import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled4/Chart/Chart.dart';
import 'package:untitled4/Controllers/ApiService.dart';
import 'package:untitled4/models/trailer.dart';
import 'package:untitled4/screens/pdfViewScreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Chart/LessonButton.dart';
import '../models/course.dart';
import 'VideoPlayerWidget.dart';
import '../Controllers/pdf.dart';

class Coursedetail extends StatefulWidget {
  final String categoryTitle;
  final Course course;

  Coursedetail({Key? key, required this.categoryTitle, required this.course}) : super(key: key);

  @override
  _CoursedetailState createState() => _CoursedetailState();
}

class _CoursedetailState extends State<Coursedetail> {
  ApiService _apiService = ApiService();
  Pdf pdf = Pdf();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryTitle,
          style: GoogleFonts.getFont(
            'Mulish',
            fontWeight: FontWeight.w700,
            fontSize: 26,
            height: 1.3,
            color: AppColors.CourseDestail,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        actions: [
          FutureBuilder<String?>(
            future: _apiService.getParticipation(widget.course.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(); // Placeholder until future completes
              } else {
                final String? isParticipated = snapshot.data;

                if (isParticipated != null) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    child: Text(
                      isParticipated,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    child: Text(
                      'is not subscribed',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF000000),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  color: AppColors.backgroundColor,
                  padding: EdgeInsets.fromLTRB(32.6, 12, 14.3, 306),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


//------------------------------------------trailer-----------------------------------------------------
            FutureBuilder<Trailer?>(
              future: _apiService.getTrailer(widget.course.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(); // Placeholder until future completes
                } else {
                  final Trailer? trailer = snapshot.data;

                  if (trailer != null) {
                    return Container(
                      height: 250, // Adjust the height as needed
                      child: VideoPlayerWidget(url: trailer.video),
                    );
                  } else {
                    return Container(
                      height: 250,
                      child: Text(
                        'no video found',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                }
              },
            ),

            //-------------------------------------------------------------
            /*Container(
              height: 250, // Adjust the height as needed
              child: VideoPlayerWidget(url: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"), // Pass videoUrl directly
            ),*/
            Positioned(
              left: 20,
              right: 20,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(0, 4),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 360,
                  height: 460,
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        widget.course.title,
                        style: GoogleFonts.getFont(
                          'Mulish',
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                          height: 1.3,
                          color: AppColors.CourseDestail,
                        ),
                      ),
                      SizedBox(height: 40),


                      Expanded(
                        child: FutureBuilder<String?>(
                          future: _apiService.getParticipation(widget.course.id),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else {
                              final String? isParticipated = snapshot.data;
                              return ListView.builder(
                                itemCount: widget.course.lectures?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final lecture = widget.course.lectures?[index];
                                  return Column(
                                    children: [
                                      ExpansionTile(
                                        title: LessonButton(
                                          number: index + 1,
                                          title: lecture?.title ?? '',
                                          description: lecture?.description ?? '',
                                          onTap: () {
                                            print("Lecture title: ${lecture?.title}");
                                            print("Lecture description: ${lecture?.description}");
                                            print("Lecture attachments: ${lecture?.attachments}");
                                            print("Lecture video URL: ${lecture?.attachments.video}");
                                            // No navigation here, just logging information
                                          },
                                        ),
                                        children: [
                                          if (isParticipated == 'approved')
                                            Column(
                                              children: [
                                                if (lecture?.attachments.video.isNotEmpty ?? false)
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(Icons.play_circle_outline),
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => Scaffold(
                                                                appBar: AppBar(
                                                                  title: Text(lecture?.title ?? ''),
                                                                ),
                                                                body: Center(
                                                                  child: Container(
                                                                    height: 600, // Adjust the height as needed
                                                                    child: Column(
                                                                      children: [
                                                                        Container(
                                                                          height: 250,
                                                                          child: VideoPlayerWidget(
                                                                            url: lecture?.attachments.video ?? '',
                                                                          ),
                                                                        ),
                                                                        SizedBox(height: 50),
                                                                        Container(
                                                                          padding: EdgeInsets.fromLTRB(20, 0,20, 0),
                                                                          child:Text(
                                                                          lecture!.attachments.description,
                                                                          style: TextStyle(fontSize: 14),
                                                                     ),
                                                                        ),
                                                                      ],
                                                                  ),
                                                                ),
                                                                ),
                                                              ),
                                                            ),

                                                          );
                                                        },
                                                      ),
                                                      IconButton(
                                                        icon: Icon(Icons.picture_as_pdf_outlined),
                                                        onPressed: () async {
                                                          // Platform-specific initialization for WebView
                                                          if (Platform.isAndroid || Platform.isIOS) {
                                                            WebView.platform = SurfaceAndroidWebView();
                                                          }
                                                          // Replace with your logic to download the PDF
                                                          String pdfUrl = lecture?.attachments.pdf ?? '';
                                                          if (pdfUrl.isNotEmpty) {

                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => Pdfviewscreen(pdfUrl: pdfUrl),
                                                                ),
                                                              );

                                                          } else {
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(content: Text('No PDF available')),
                                                            );
                                                          }
                                                        },
                                                      ),

                                                    ],
                                                  )
                                                else
                                                  Text('No video URL available'),
                                              ],
                                            )
                                          else
                                            Text('You do not have access to view this lecture'),
                                        ],
                                      ),
                                      // Divider(),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),






                      FutureBuilder<String?>(
                        future: _apiService.getParticipation(widget.course.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator(); // Show a loading indicator while waiting
                          } else {
                            final String? isParticipated = snapshot.data;
                            bool isEnrolled =
                                isParticipated == 'pending' || isParticipated == 'approved' || isParticipated == 'declined';

                            return SizedBox(
                              width: 320, // Adjust the width as needed
                              height: 50, // Adjust the height as needed
                              child: ElevatedButton(
                                onPressed: isEnrolled
                                    ? null
                                    : () async {
                                  bool status = await _apiService.requestParticipation(widget.course.id);
                                  if (status) {
                                    setState(() {
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isEnrolled ? Colors.grey : AppColors.buttonColor, // Example button color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 5,
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      isEnrolled ? 'Enrolled' : 'Enroll Course',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
