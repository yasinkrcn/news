import 'package:flutter/material.dart';
import 'package:news/feature/home/view/widgets/custom_web_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebview extends StatelessWidget {
  final String url;

  const CustomWebview({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CustomWebPage(
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}