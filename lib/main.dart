import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/screens/catigory_page.dart';
import 'package:pharma_web/screens/home.dart';
import 'package:pharma_web/screens/login.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: //catigorypage()
          homepage(),
      //   loginScrean(

      //  ),
    );
  }
}
