import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/category_drop.dart';
import 'package:flutter_application_1/widgets/date_time.dart';
import 'package:flutter_application_1/widgets/tex_form_midicin.dart';

class MedicinFormScreen extends StatefulWidget {
  MedicinFormScreen({super.key});

  @override
  State<MedicinFormScreen> createState() => _MedicinFormScreenState();
}

class _MedicinFormScreenState extends State<MedicinFormScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                      child: Text(
                        'Medication Detail',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w300,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 100,
                      endIndent: 100,
                      height: 10,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormMidicn(labelText: "Enter the scientific name"),
                    TextFormMidicn(labelText: "Enter the trade name"),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(child: CategoryDropDown()),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(child: PickDateWidget())
                        ],
                      ),
                    ),
                    TextFormMidicn(labelText: "Enter the manufacturer name"),
                    TextFormMidicn(labelText: "Enter the available quantity"),
                    TextFormMidicn(labelText: " Enter date entihaa salahia"),
                    TextFormMidicn(labelText: "Enter the price"),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
