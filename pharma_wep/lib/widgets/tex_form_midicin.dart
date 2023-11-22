import "package:flutter/material.dart";

class TextFormMidicn extends StatelessWidget {
  TextFormMidicn({super.key,  this.labelText});
  String? labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.deepPurple),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          filled: true,
          fillColor: Colors.purple[100],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.transparent,
              )),
        ),
      ),
    );
  }
}
//"Enter the trade name"
