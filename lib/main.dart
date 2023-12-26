import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/screens/catigory_page.dart';
import 'package:pharma_web/screens/home.dart';
import 'package:pharma_web/screens/main_page.dart';
import 'package:pharma_web/screens/order_details.dart';

import 'models/order.dart';

var kColorScheme =
ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 67, 201, 201));

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
         useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          )),
     // themeMode: ThemeMode.dark,
    //  debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: //catigorypage()
        homepage(),
      //MainPage()
      //OrderDataisPage(order: Order(),)

    );
  }
}
