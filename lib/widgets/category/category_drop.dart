//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pharma_web/controllers/add_medicine_controller.dart';
import 'package:pharma_web/data/category_list.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({super.key});

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  String? valuechoose;
 var listItem=categoryList.map((e) => e.name).toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.centerLeft,
      width: 700,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
          color: const Color.fromARGB(255, 105, 206, 240),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButton(
          hint: Text(
            "Select catigory",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          dropdownColor: Colors.white,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
            size: 30,
          ),
          isExpanded: true,
          value: valuechoose,
          onChanged: (newValue) {
            setState(() {
              valuechoose = newValue as String?;
              for(var e in categoryList){
                if(e.name== valuechoose){
                  chosenCategory=e.id;
                  print(chosenCategory);
                }
              }
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
