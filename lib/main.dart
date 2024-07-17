import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/screens/Home.dart';
import 'package:untitled4/screens/SignIn.dart';
import 'package:untitled4/screens/Welcome.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Controllers/AuthService.dart';
import 'Controllers/CourseProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (Platform.isAndroid || Platform.isIOS) {
    WebView.platform = SurfaceAndroidWebView();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkillVortex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/welcome',
      home: FutureBuilder<bool>(
        future: _authService.isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            print('snapshot data: ${snapshot.data}');
            if (snapshot.hasData && snapshot.data == true) {
              // Navigate to Home screen
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, '/home');
              });
              return Container(); // Return an empty container while navigating
            } else {
              // Navigate to SignInScreen if not logged in
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, '/signin');
              });
              return Container(); // Return an empty container while navigating
            }
          }
        },
      ),


      routes: {
        '/welcome': (context) => Welcome(),
        '/signin': (context) => SignInScreen(),
        '/home': (context) => Home(),
      },
    );
  }
}
