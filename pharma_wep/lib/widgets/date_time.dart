import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

class PickDateWidget extends StatefulWidget {
  PickDateWidget({super.key});

  @override
  State<PickDateWidget> createState() => _PickDateWidgetState();
}

class _PickDateWidgetState extends State<PickDateWidget> {
  // note tell the backend about the first and the last date
  final initialDate = DateTime.now();

  final firstDate = DateTime.now();

  final lastDate = DateTime(
      DateTime.now().year + 3, DateTime.now().month, DateTime.now().day);
  DateTime? _selectedDate = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Text(
              _selectedDate == null
                  ? "select date"
                  : "${formatter.format(_selectedDate!)}",
              style: TextStyle(fontSize: 16, color: Colors.deepPurple),
            ),
          ),
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                onPressed: () async {
                  var pickedDate = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: firstDate,
                      lastDate: lastDate);
                  setState(() {
                    _selectedDate = pickedDate;
                    print(_selectedDate);
                  });
                },
                child: Text(
                  "Pick date",
                  style: TextStyle(fontSize: 12),
                )),
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.purple[100]),
    );
  }
}
