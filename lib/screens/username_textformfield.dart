import 'package:flutter/material.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _usernameState();
}

class _usernameState extends State<UserName> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? phone;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) {
        username = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "the name is not correct";
        }

        return null;
      },
      autofocus: true,
      decoration: InputDecoration(
        //counterText: '',
        suffixIcon: Icon(Icons.person),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        labelText: "User_Name",
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
    );
  }
}
