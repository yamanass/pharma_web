import 'package:flutter/material.dart';

class cati_form extends StatefulWidget {
  cati_form({super.key, this.Text, required Center child});
  String? Text;
  @override
  State<cati_form> createState() => _cati_formState();
}

class _cati_formState extends State<cati_form> {
  String? Textcati;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color.fromARGB(255, 43, 116, 225), Colors.white]),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 43, 116, 225),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      // child: Center(
      //     child: Text(
      //   Textcati!,
      //   style: TextStyle(fontSize: 30),
      // )),
    );
  }
}
