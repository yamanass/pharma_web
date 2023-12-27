
import 'package:flutter/material.dart';
import 'package:pharma_web/utils/kcolors_utils.dart';

class ChangeStatusButton extends StatelessWidget {
   ChangeStatusButton({super.key, required this.explanation, required this.status, required this.onChange});
    String explanation;
    String status;
    void Function() onChange;
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Text(
    explanation,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 16,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: status=="Paid"||status=="Received"?0:0.8, // Set elevation to 0 to remove the shadow
              backgroundColor: Kblue, // Set your desired background color
            ),
            onPressed: onChange, child: Text(status)),
      ],
    );
  }
}
