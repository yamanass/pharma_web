import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/data/category_list.dart';
import 'package:pharma_web/providers/auth_data_provider.dart';
import 'package:pharma_web/screens/login.dart';

import '../services/get_categories_service.dart';

class homepage extends ConsumerWidget {

  const homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenReader = ref.read(tokenProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffa3d7f9),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 1),
                height: 400,
                width: double.infinity,
                child: Image.asset(
                  height: double.infinity,
                  width: double.infinity,
                  'assets/images/54affec9687c83ebe4ab261f257ab4c1.gif',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  height: 200,
                  width: 600,
                  child: Text(
                    'Welcome to our app.Click sign in and enjoy selecting the most wonderful medicines 🔥',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'kaushan script'),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(13)),
                child: MaterialButton(
                  onPressed: () {

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => loginScrean()));

                  },
                  child: Text(
                    "sign in",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
