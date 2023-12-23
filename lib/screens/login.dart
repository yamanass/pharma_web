import 'package:flutter/material.dart';
import 'package:pharma_web/screens/catigory_page.dart';
import 'package:pharma_web/screens/medicin_form.dart';
import 'package:pharma_web/screens/username_textformfield.dart';
import 'package:pharma_web/widgets/passwordfield.dart';
import 'package:pharma_web/widgets/tex_form_midicin.dart';

class loginScrean extends StatefulWidget {
  loginScrean({super.key});

  @override
  State<loginScrean> createState() => _loginScreanState();
}

class _loginScreanState extends State<loginScrean> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? phone;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          height: 800,
          width: 800,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 6),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                height: 350,
                                width: 800,
                                child: Image.asset(
                                    'assets/images/3bd9b81a60f2f11b5fab692d2a2b96a9.jpg'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              UserName(),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormMidicn(
                                labelText: "Phone",
                                icon: Icon(
                                  Icons.phone_iphone,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              passwordfield(
                                labelText: "Password",
                                //icon: Icon(Icons.visibility_off),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Container(
                                height: 45,
                                width: 800,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 43, 116, 225),
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  catigorypage()));
                                    }
                                  },
                                  child: Text(
                                    "LogIN",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
