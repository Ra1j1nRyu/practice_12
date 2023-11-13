import 'package:flutter/material.dart';
import 'package:practice_12/routes.dart';
import 'package:practice_12/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'api/firebase_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashRoute,
      routes: routes,
      home: LoginView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}