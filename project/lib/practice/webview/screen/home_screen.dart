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
        backgroundColor: Colors.orange,
        title: const Text('seong woo'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.loadRequest(homeUrl),
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () => controller.goBack(),
            icon: const Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () => controller.goForward(),
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
