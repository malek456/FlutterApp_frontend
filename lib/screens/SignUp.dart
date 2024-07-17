import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled4/Controllers/RegisterUser.dart';
import '../Chart/Chart.dart';
import 'Home.dart';
import 'SignIn.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final Registeruser _registeruser = Registeruser();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  bool _isPhoneValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isFirstNameValid = false;
  bool _isLastNameValid = false;

  void _validateFields() {
    setState(() {
      _isPhoneValid = _phoneController.text.isNotEmpty;
      _isEmailValid = _emailController.text.isNotEmpty;
      _isPasswordValid = _passwordController.text.isNotEmpty;
      _isFirstNameValid = _firstNameController.text.isNotEmpty;
      _isLastNameValid = _lastNameController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 12, 0, 0),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 12, 14.3, 19),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(32.6, 0, 0, 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      //---------------------------logo and slogan-------------------
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Container(
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
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 49, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
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
                      //---------------------------------------------------------
                      Container(
                        margin: EdgeInsets.fromLTRB(34, 0, 34, 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Getting Started.!',
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
                        margin: EdgeInsets.fromLTRB(35, 0, 35, 28),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Create an Account to Continue your Courses',
                            style: GoogleFonts.getFont(
                              'Mulish',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xFF545454),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 30, top: 0),
                                child: Container(
                                  width: 150, // Set your desired width
                                  height: 60, // Set your desired height
                                  child: TextField(
                                    controller: _firstNameController,
                                    decoration: InputDecoration(
                                      filled: true, // Enable the fillColor property
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Name',
                                      errorText: _firstNameController.text.isNotEmpty
                                          ? null
                                          : ' enter your first name',
                                    ),
                                    onChanged: (value) {
                                      _validateFields();
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, top: 0),
                                child: Container(
                                  width: 160, // Set your desired width
                                  height: 60, // Set your desired height
                                  child: TextField(
                                    controller: _lastNameController,
                                    decoration: InputDecoration(
                                      filled: true, // Enable the fillColor property
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Last Name',
                                      errorText: _lastNameController.text.isNotEmpty
                                          ? null
                                          : ' enter your last name',
                                    ),
                                    onChanged: (value) {
                                      _validateFields();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Container(
                              width: 320, // Set your desired width
                              height: 60, // Set your desired height
                              child: TextField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  filled: true, // Enable the fillColor property
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Phone Number',
                                  errorText: _phoneController.text.isNotEmpty
                                      ? null
                                      : ' enter your phone number',
                                ),
                                onChanged: (value) {
                                  _validateFields();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Container(
                              width: 320, // Set your desired width
                              height: 60, // Set your desired height
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  filled: true, // Enable the fillColor property
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Email',
                                  errorText: _emailController.text.isNotEmpty
                                      ? null
                                      : ' enter your email',
                                ),
                                onChanged: (value) {
                                  _validateFields();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Container(
                              width: 320, // Set your desired width
                              height: 60, // Set your desired height
                              child: TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  filled: true, // Enable the fillColor property
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Password',
                                  errorText: _passwordController.text.isNotEmpty
                                      ? null
                                      : ' enter your password',
                                ),
                                onChanged: (value) {
                                  _validateFields();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Container(
                              width: 320, // Set your desired width
                              height: 60, // Set your desired height
                              child: TextField(
                                controller: _passwordController2,
                                decoration: InputDecoration(
                                  filled: true, // Enable the fillColor property
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Confirm Password',
                                  errorText: _passwordController2.text.isNotEmpty
                                      ? null
                                      : ' confirm your password',
                                ),
                                onChanged: (value) {
                                  _validateFields();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      //----------------------------------button--------------------------------------------
                      SizedBox(height: 20),
                      /*ElevatedButton(
                        onPressed: () async {
                          print('Register button pressed');
                          await _registeruser.registerUser(
                            _emailController.text,
                            _passwordController.text,
                            _firstNameController.text,
                            _lastNameController.text,
                            _phoneController.text,
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Text('Register'),
                      ),*/









                      Padding(
                        padding: EdgeInsets.only(left: 35), // Add padding only to the left
                        child: SizedBox(
                          width: 320, // Adjust the width as needed
                          height: 50, // Adjust the height as needed
                          child: ElevatedButton(
                            onPressed: () async {
                              if(_isEmailValid && _isFirstNameValid && _isLastNameValid && _isPhoneValid && _isPasswordValid) {
                                print('Register button pressed');
                                await _registeruser.registerUser(
                                  _emailController.text,
                                  _passwordController.text,
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  _phoneController.text,
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              }
                              else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('registarion failed.'),
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









                      SizedBox(height: 20),
                      //------------------------------------------------
                      Padding(
                        padding: EdgeInsets.only(left: 70), // 20 pixels padding on the left
                        child: Row(
                          children: [
                            Text(
                              'Already have an Account? ',
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
                                  MaterialPageRoute(builder: (context) => SignInScreen()), // Replace with your destination page
                                );
                              },
                              child: Text(
                                'SIGN IN',
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
                      )
                      //--------------------------------------------------------
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
