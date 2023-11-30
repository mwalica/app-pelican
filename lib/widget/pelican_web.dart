import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PelicanWeb extends StatefulWidget {
  const PelicanWeb({super.key, required this.controller});

  final WebViewController controller;

  @override
  State<PelicanWeb> createState() => _PelicanWebState();
}

class _PelicanWebState extends State<PelicanWeb> {
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setNavigationDelegate(NavigationDelegate(onPageStarted: (url) {
        setState(() {
          loadingPercentage = 0;
        });
      }, onProgress: (progress) {
        setState(() {
          loadingPercentage = progress;
        });
      }, onPageFinished: (url) {
        setState(() {
          loadingPercentage = 100;
        });
      }))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('SnackBar', onMessageReceived: (message) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message.message)));
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          WebViewWidget(controller: widget.controller),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            )
        ],
      ),
    );
    ;
  }
}
