import 'package:flutter/material.dart';
import 'package:untitled4/Chart/Chart.dart';
import '../Controllers/MyImagePicker.dart';




class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: AppColors.backgroundColor,
      body: Container(

        decoration: BoxDecoration(
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 12, 14.3, 19),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min, // To keep the Row size just as big as its children
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Modify your profile', // The text you want to display
                      style: TextStyle(
                        fontSize: 20, // Adjust the font size as needed
                        fontWeight: FontWeight.bold, // Optional: to make text bold
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 50),
              MyImagePicker(),


              Padding(
                padding: EdgeInsets.only(left: 0, top: 30),
                child: Container(
                  width: 320, // Set your desired width
                  height: 60, // Set your desired height
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true, // Enable the fillColor property
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),),

                      labelText: 'name',
                    ),
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(left: 0, top: 10),
                child: Container(
                  width: 320, // Set your desired width
                  height: 60, // Set your desired height
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true, // Enable the fillColor property
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),),

                      labelText: 'last name',
                    ),
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(left: 0, top: 10),
                child: Container(
                  width: 320, // Set your desired width
                  height: 60, // Set your desired height
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true, // Enable the fillColor property
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),),

                      labelText: 'Date of birth',
                    ),

                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(left: 0, top: 10),
                child: Container(
                  width: 320, // Set your desired width
                  height: 60, // Set your desired height
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true, // Enable the fillColor property
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),),

                      labelText: 'Email',
                    ),
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(left: 0, top: 10),
                child: Container(
                  width: 320, // Set your desired width
                  height: 60, // Set your desired height
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true, // Enable the fillColor property
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),),

                      labelText: 'Phone Number',
                    ),
                  ),
                ),
              ),



              Padding(
                padding: EdgeInsets.only(left: 0, top: 10),
                child: Container(
                  width: 320, // Set your desired width
                  height: 60, // Set your desired height
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Select Gender',
                    ),
                    value: 'Male', // Default value
                    items: ['Male', 'Female']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle change
                    },
                  ),
                ),
              ),

//---------------------continue button-----------------------------------------
              SizedBox(height: 20),
              SizedBox(
                width: 320, // Adjust the width as needed
                height: 50, // Adjust the height as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Your action here
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
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}