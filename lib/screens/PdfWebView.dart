import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PdfWebView extends StatelessWidget {
  final String pdfPath;

  const PdfWebView({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'file://$pdfPath',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
