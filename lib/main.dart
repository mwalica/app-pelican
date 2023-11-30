import 'package:app_pelikan_2/firebase_options.dart';
import 'package:app_pelikan_2/views/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//firebase notification init
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//statusbar and navigation bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 41, 47, 54),
      systemNavigationBarColor: Color.fromARGB(255, 41, 47, 54),
      statusBarBrightness: Brightness.dark,
    ),
  );

//lock orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'apppelican.com',
      theme: ThemeData.dark(),
      // color: const Color.fromARGB(255, 41, 47, 54),
      home: const WebViewScreen(),
    );
  }
}
