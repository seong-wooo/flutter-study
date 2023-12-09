import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://seongwoo.oopy.io');

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => controller.loadRequest(homeUrl),
          icon: Icon(Icons.home),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.reload(),
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () => controller.goBack(),
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () => controller.goForward(),
            icon: Icon(Icons.arrow_forward),
          ),
        ],
        title: const Text('seong woo\'s blog'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
