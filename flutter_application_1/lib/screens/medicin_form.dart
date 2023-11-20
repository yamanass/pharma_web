import 'package:flutter/material.dart';

class details extends StatefulWidget {
  details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  String? valuechoose;
  List listItem = ["Item 1", "Item 2", "Item 3", "Item 4"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.deepPurple,
                              )),
                              labelText: "Enter the scientific name",
                              labelStyle: TextStyle(color: Colors.deepPurple),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              filled: true,
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple)),
                                labelText: "Enter the trade name",
                                labelStyle: TextStyle(color: Colors.deepPurple),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 30),
                                filled: true,
                                fillColor: Colors.transparent,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple,
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Container(
                              padding: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Container(
                                  child: DropdownButton(
                                      hint: Text(
                                        "Select catigory",
                                        style:
                                            TextStyle(color: Colors.deepPurple),
                                            
                                      ),
                                      dropdownColor: Colors.grey,
                                      icon: Icon(Icons.arrow_drop_down),
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
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple)),
                                labelText: "Enter the name of the manufacturer",
                                labelStyle: TextStyle(color: Colors.deepPurple),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 30),
                                filled: true,
                                fillColor: Colors.transparent,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple)),
                                labelText: "Enter the available quantity",
                                labelStyle: TextStyle(color: Colors.deepPurple),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 30),
                                filled: true,
                                fillColor: Colors.transparent,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple)),
                                labelText: " Enter date entihaa salahia",
                                labelStyle: TextStyle(color: Colors.deepPurple),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 30),
                                filled: true,
                                fillColor: Colors.transparent,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple)),
                                labelText: "Enter the price",
                                labelStyle: TextStyle(color: Colors.deepPurple),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 30),
                                filled: true,
                                fillColor: Colors.transparent,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
