import 'package:flutter/material.dart';
import 'package:pharma_web/widgets/category_drop.dart';
import 'package:pharma_web/widgets/date_time.dart';
import 'package:pharma_web/widgets/tex_form_midicin.dart';

class MedicinFormScreen extends StatefulWidget {
  MedicinFormScreen({super.key});

  @override
  State<MedicinFormScreen> createState() => _MedicinFormScreenState();
}

class _MedicinFormScreenState extends State<MedicinFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 1000,
        width: 1000,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                        child: Text(
                          'Medication Detail',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        width: 500,
                        child: Image.asset(
                            'assets/images/67dd227c069c17b83d8dbaa991d9a35e.jpg'),
                      ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      TextFormMidicn(labelText: "Enter the scientific name", controller: TextEditingController(),),
                      TextFormMidicn(labelText: "Enter the trade name", controller: TextEditingController()),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(child: CategoryDropDown()),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(child: PickDateWidget())
                          ],
                        ),
                      ),
                      TextFormMidicn(labelText: "Enter the manufacturer name", controller: TextEditingController()),
                      SizedBox(
                        width: 20,
                      ),
                      TextFormMidicn(labelText: "Enter the available quantity", controller: TextEditingController()),
                      SizedBox(
                        width: 20,
                      ),
                      TextFormMidicn(labelText: "Enter the price", controller: TextEditingController()),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 105, 206, 240),
                            borderRadius: BorderRadius.circular(13)),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MedicinFormScreen()));
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
