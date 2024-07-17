import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Pdf {

  Future<bool> downloadPDF(BuildContext context, String url) async {
    try {
      print('Attempting to download PDF from: $url');


      var response = await http.get(Uri.parse(url));
      print('Response status code: ${response.statusCode}');


      if (response.statusCode == 200) {
        var appDocDir = await getApplicationDocumentsDirectory();
        String filePath = '${appDocDir.path}/downloaded.pdf';

        var file = await File(filePath).writeAsBytes(response.bodyBytes);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('PDF downloaded successfully')),
        );

        return true;
      } else {
        throw Exception('Failed to load PDF. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download PDF')),
      );
      return false;
    }
  }

  downloadFile(var filePath, var documentUrl) async {
    try {
      /// setting filename
      final filename = filePath;
      print(filename);
      String dir = (await getApplicationDocumentsDirectory()).path;
      print(dir);
      if (await File('$dir/$filename').exists()) return File('$dir/$filename');

      String url = documentUrl;
      print(url);

      /// requesting http to get url
      var request = await HttpClient().getUrl(Uri.parse(url));

      /// closing request and getting response
      var response = await request.close();

      /// getting response data in bytes
      var bytes = await consolidateHttpClientResponseBytes(response);

      /// generating a local system file with name as 'filename' and path as '$dir/$filename'
      File file = new File('$dir/$filename');

      /// writing bytes data of response in the file.
      await file.writeAsBytes(bytes);

      return file;
    }
    catch (err) {
      print(err);
    }
  }
}
