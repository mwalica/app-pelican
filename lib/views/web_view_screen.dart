import 'package:app_pelikan_2/widget/pelican_web.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

const String baseUrl = 'https://apppelican.com/education/recommended';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;

  void setupPushNotofications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();

    final token = await fcm.getToken();
    print('token: $token');
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(baseUrl),
      );

    setupPushNotofications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: PelicanWeb(controller: controller),
    ));
  }
}
