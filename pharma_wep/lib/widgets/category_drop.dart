import 'package:flutter/material.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({super.key});

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  String? valuechoose;
  List listItem = ["Item 1", "Item 2", "Item 3", "Item 4"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.centerLeft,
      width: 700,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButton(
          hint: Text(
            "Select catigory",
            style: TextStyle(color: Colors.deepPurple),
          ),
          dropdownColor: Colors.white,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.deepPurple,
            size: 30,
          ),
          isExpanded: true,
          value: valuechoose,
          onChanged: (newValue) {
            setState(() {
              valuechoose = newValue as String?;
            });
          },
          items: listItem.map((valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Text(valueItem),
            );
          }).toList()),
    );
  }
}
