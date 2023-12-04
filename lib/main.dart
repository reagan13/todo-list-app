// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_list_application/authentication/login/authenticator.dart';
import 'package:todo_list_application/authentication/login/login.dart';
import 'package:todo_list_application/authentication/login/login-raw1.dart';
import 'firebase_options.dart';
import 'package:todo_list_application/introduction/cover_page.dart';
import 'package:todo_list_application/introduction/onboarding.dart';
import 'package:todo_list_application/screen/homepage.dart';
import 'package:todo_list_application/widget/navigation_menu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const Onboarding(),
    );
  }
}
