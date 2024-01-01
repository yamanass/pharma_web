import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharma_web/controllers/add_medicine_controller.dart';
import 'package:pharma_web/data/rerquest_report.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

class PickDateWidget extends StatefulWidget {
  PickDateWidget({super.key, required this.initialDate, required this.firstDate, required this.lastDate, required this.isForAdd,
  required this.isLast});
  final initialDate;
  final firstDate;
  final lastDate;
  bool isForAdd;
  bool isLast;

  @override
  State<PickDateWidget> createState() => _PickDateWidgetState();
}

class _PickDateWidgetState extends State<PickDateWidget> {
  // note tell the backend about the first and the last date

  DateTime? _selectedDate = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 70, 201, 210)
          //color: Color(0xff9bc3ff),
          ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _selectedDate == null
                  ? "select date"
                  : "${formatter.format(_selectedDate!)}",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: //Color.fromARGB(255, 43, 116, 225),
                      const Color.fromARGB(255, 70, 201, 210))),
              child: Builder(builder: (BuildContext context) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 70, 201, 210)),
                    onPressed: () async {
                      var pickedDate = await showDatePicker(
                          context: context,
                          initialDate: widget.initialDate,
                          firstDate: widget.firstDate,
                          lastDate: widget.lastDate);
                      setState(() {

                          if(widget.isForAdd) {
                            chosenDate=pickedDate!;
                          }else{
                            if(widget.isLast){
                              lastChosenDate=pickedDate!;
                              print("lastChosenDate: $lastChosenDate");
                            }else{
                              firstChosenDate=pickedDate!;
                              print("firstChosenDate: $firstChosenDate");
                            }
                          }
                        _selectedDate = pickedDate;
                        print(_selectedDate);
                      });
                    },
                    child: Text(
                      "Pick date",
                      style: TextStyle(fontSize: 12),
                    ));
              }),
            ),
          )
        ],
      ),
    );
  }
}
