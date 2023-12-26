import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/screens/catigory_page.dart';
import 'package:pharma_web/screens/main_page.dart';

import 'package:pharma_web/services/auth_service.dart';
import 'package:pharma_web/widgets/auth/aut_button.dart';
import 'package:pharma_web/widgets/auth/auth_text_field.dart';
import 'package:pharma_web/widgets/passwordfield.dart';
import 'package:pharma_web/widgets/tex_form_midicin.dart';

import '../data/error_message.dart';
import '../models/auth/login.dart';
import '../providers/auth_data_provider.dart';
import '../providers/user_provider.dart';

class loginScrean extends ConsumerStatefulWidget {
  loginScrean({super.key});

  @override
  ConsumerState<loginScrean> createState() => _loginScreanState();
  var phoneCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
}

class _loginScreanState extends ConsumerState<loginScrean> {
  void _showErrorSnackBar(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Text(content),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          // Perform any additional action if needed
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onSaved(BuildContext context, WidgetRef ref) async {
    if (_formKey.currentState!.validate())  {
      _formKey.currentState!.save();

      // define the model we want to send
      final login = LoginModel(
          phone: widget.phoneCtrl.text.toString(),
          password: widget.passwordCtrl.text.toString());

      final _authWatcher = await ref.watch(authProvider).getUser(login);

      if(error==null) {
        ref.watch(userProvider.notifier).setUser(_authWatcher!.user!);
        ref.watch(tokenProvider.notifier).setToken(_authWatcher.token!);

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
          return  MainPage();
          //return HomeScreen();
        }));
      }
      if(error!=null){
        // print(error);
        _showErrorSnackBar(context, error!);
        error =null;
      }

    }
}





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


                            //  THE USER NAME FIELD THAT WE DONT WANT
                            // UserName(),
                            // RegexTextField(topic: FormsTopic.userName, label: "enter your user name", ctrl: )
                            // SizedBox(
                            //   height: 20,
                            // ),



                            RegexTextField(topic: FormsTopic.phoneNumber, label: "Enter your phone number", ctrl: widget.phoneCtrl),

                            SizedBox(
                              height: 30,
                            ),
                            RegexTextField(topic: FormsTopic.password, label: "Enter yous passowrd", ctrl: widget.passwordCtrl),








                            SizedBox(
                              height: 60,
                            ),



                            // login button
                            Container(
                              height: 45,
                              width: 750,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 43, 116, 225),
                                  borderRadius: BorderRadius.circular(20)),
                              child: MaterialButton(
                                onPressed: (){_onSaved(context,ref);},
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
    );
  }
}
