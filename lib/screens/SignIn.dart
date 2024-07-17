import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled4/Chart/Chart.dart';
import '../Controllers/AuthService.dart';
import 'Home.dart';
import 'SignUp.dart';





class SignInScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();




   SignInScreen({Key? key}) : super(key: key);







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 12, 14.3, 19),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(32.6, 0, 0, 31),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,

                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 38),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/logoApp.png'),
                                ),
                              ),
                              child: Container(
                                width: 186,
                                height: 156,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 49, 0, 46),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'SkillVortex',
                                        style: GoogleFonts.getFont(
                                          'Jost',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          letterSpacing: -0.3,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0.4, 0, 0, 0),
                                    child: Text(
                                      'DIVE DEEP INTO KNOWLEDGE',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(34, 0, 34, 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Let’s Sign Up.!',
                          style: GoogleFonts.getFont(
                            'Jost',
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color(0xFF202244),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(35, 0, 35, 50),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Login to Your Account to Continue your Courses',
                          style: GoogleFonts.getFont(
                            'Mulish',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xFF545454),
                          ),
                        ),
                      ),
                    ),

                    //----------------------------------email and password------------------------------------




                    Padding(
                      padding: EdgeInsets.only(left: 35, top: 30),
                      child: Container(
                        width: 320, // Set your desired width
                        height: 60, // Set your desired height
                        child: TextField(
                          controller: _emailController, // Corrected line
                          decoration: InputDecoration(
                            filled: true, // Enable the fillColor property
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Email', // Changed from 'name' to 'Email'
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 35, top: 10),
                      child: Container(
                        width: 320, // Set your desired width
                        height: 60, // Set your desired height
                        child: TextField(
                          controller: _passwordController, // Corrected line
                          decoration: InputDecoration(
                            filled: true, // Enable the fillColor property
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Password', // Changed from 'name' to 'Email'
                          ),
                        ),
                      ),
                    ),




                    // ------------------------------ sign in button -----------------------------


                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.only(left: 35), // Add padding only to the left
                      child: SizedBox(
                        width: 320, // Adjust the width as needed
                        height: 50, // Adjust the height as needed
                        child: ElevatedButton(
                          onPressed: () async {
                            print('aaaaaaaaaa: ${_emailController.text} as String');
                            print('aaaaaaaaaa: ${_passwordController.text} as String');
                            String variable='';

                            bool loginSuccess = await _authService.loginUser(_emailController.text, _passwordController.text);

                            if (loginSuccess) {
                              String token= _authService.retreiveToken(variable);
                              print('token is in home:$token');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login failed. Please check your email and password.'),
                                  duration: Duration(seconds: 3), // Adjust the duration as needed
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30), // Rounded corners
                            ),
                            elevation: 5, // Shadow depth
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Control size with padding
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // To keep the Row size just as big as its children
                            children: [
                              Text(
                                'Continue',
                                style: TextStyle(
                                  color: Colors.white, // Change text color here
                                  fontSize: 16, // Adjust font size if needed
                                ),
                              ),
                              Icon(Icons.arrow_forward), // Arrow icon
                            ],
                          ),
                        ),
                      ),
                    ),
                    // ------------------------- Google Sign-In button -----------------------------

                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 35), // Add padding only to the left
                      child: SizedBox(
                        width: 320, // Adjust the width as needed
                        height: 50, // Adjust the height as needed
                        child: ElevatedButton.icon(
                          onPressed: ()  async {
                            bool success = await _authService.signInWithGoogle();
                            // Navigate to Home after sign-in
                            if(success== true) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            }
                            else
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login avec google failed.'),
                                  duration: Duration(seconds: 3), // Adjust the duration as needed
                                ),
                              );


                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30), // Rounded corners
                            ),
                            elevation: 5, // Shadow depth
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Control size with padding
                          ),
                          icon: SvgPicture.asset(
                            'assets/google_logo.svg', // Ensure you have the Google logo in your assets
                            height: 24,
                            width: 24,
                          ),
                          label: Text(
                            'Sign in with Google',
                            style: TextStyle(
                              color: Colors.black, // Change text color here
                              fontSize: 16, // Adjust font size if needed
                            ),
                          ),
                        ),
                      ),
                    ),
                    //-------------------------don't have ana account------------------------------
                    SizedBox(height: 100),
                    Padding(
                      padding: EdgeInsets.only(left: 70), // 20 pixels padding on the left
                      child: Row(
                        children: [
                          Text(
                            'Do not have an account? ',
                            style: GoogleFonts.getFont(
                              'Mulish',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              height: 1.3,
                              color: Color(0xFF545454),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Signup()), // Replace with your destination page
                              );
                            },
                            child: Text(
                              'SIGN UP',
                              style: GoogleFonts.getFont(
                                'Mulish',
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                height: 1.3,
                                color: Color(0xFF332DA1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),

                    //------------------------------------------------------------------------------
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      ),
    );
  }
}