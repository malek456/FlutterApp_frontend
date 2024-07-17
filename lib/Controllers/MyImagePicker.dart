import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';




class MyImagePicker extends StatefulWidget {
  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  String? _filePath;

  void _pickFile() async {
    print('Pick file button pressed');
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (_filePath != null)
          Image.file(File(_filePath!)),
        InkWell(
          onTap: _pickFile,
          child: Container(
            width: 100, // Adjust the size as needed
            height: 100, // Adjust the size as needed
            decoration: BoxDecoration(
              color: Colors.lightBlue, // Background color of the outer circle
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: 30, // Adjust the size as needed
                height: 30, // Adjust the size as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the inner circle
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check, // The checkmark icon
                  color: Colors.lightBlue, // Icon color
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
