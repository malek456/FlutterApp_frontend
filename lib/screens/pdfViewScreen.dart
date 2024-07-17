import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Pdfviewscreen extends StatefulWidget {
  final String pdfUrl;

  Pdfviewscreen({required this.pdfUrl});

  @override
  _MyPdfViewerState createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<Pdfviewscreen> {
  String? pdfPath;
  int totalPages = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Stack(
        children: [
          pdfPath != null
              ? PDFView(
            filePath: pdfPath,
            fitEachPage: true,
            fitPolicy: FitPolicy.BOTH,
            onRender: (_pages) {
              setState(() {
                totalPages = _pages!;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$error';
              });
            },
          )
              : Center(child: CircularProgressIndicator()),
          if (!errorMessage.isEmpty)
            Center(
              child: Text(errorMessage),
            ),
        ],
      ),
    );
  }

  _loadPdf() async {
    try {
      if (widget.pdfUrl.startsWith('http') || widget.pdfUrl.startsWith('https')) {
        // Load PDF from remote URL
        final response = await http.get(Uri.parse(widget.pdfUrl));
        if (response.statusCode == 200) {
          final directory = await getApplicationDocumentsDirectory();
          final file = File('${directory.path}/my_file.pdf');
          await file.writeAsBytes(response.bodyBytes);

          setState(() {
            pdfPath = file.path;
          });
        } else {
          setState(() {
            errorMessage = 'Failed to load PDF. Status code: ${response.statusCode}';
          });
        }
      } else {
        // Convert local file path to file:// URL if necessary
        String filePath;
        if (widget.pdfUrl.startsWith('file://')) {
          filePath = Uri.parse(widget.pdfUrl).toFilePath();
        } else {
          filePath = widget.pdfUrl;
        }

        final file = File(filePath);

        if (await file.exists()) {
          setState(() {
            pdfPath = file.path;
          });
        } else {
          setState(() {
            errorMessage = 'File does not exist';
          });
        }
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }
}
