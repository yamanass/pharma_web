import "package:flutter/material.dart";

class TextFormMidicn extends StatefulWidget {
  TextFormMidicn({super.key, this.labelText, this.icon});
  String? labelText;
  Icon? icon;
   

  @override
  State<TextFormMidicn> createState() => _TextFormMidicnState();
}

class _TextFormMidicnState extends State<TextFormMidicn> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: widget.icon,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w800),
          contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
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
