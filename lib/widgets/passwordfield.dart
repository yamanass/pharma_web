import 'package:flutter/material.dart';

// ignore: must_be_immutable
class passwordfield extends StatefulWidget {
  passwordfield({
    super.key,
    this.labelText,
    this.icon,
    required this.controller
  });
  String? labelText;
  TextEditingController controller;
  Icon? icon;
  @override
  State<passwordfield> createState() => _passwordfieldState();
}

class _passwordfieldState extends State<passwordfield> {
  bool hidepass = true;
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      //padding: EdgeInsets.only(top: 15),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          // ignore: unnecessary_null_comparison
          if (value!.isEmpty || value == null) {
            return "the field is empty";
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.number,
        autofocus: true,
        obscureText: hidepass,
        decoration: InputDecoration(
          //counterText: '',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidepass = !hidepass;
                });
              },
              icon: hidepass
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w800),
          contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                color: Colors.grey,
              )),
        ),
      ),
    );
  }
}
