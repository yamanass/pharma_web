import 'package:flutter/material.dart';
import 'package:pharma_web/models/medicine.dart';
import 'package:pharma_web/widgets/card_page.dart';

class Search3 extends StatelessWidget {
  const Search3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 22, 53, 99),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(80))),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 236, 238, 238),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70.0)),
                    hintText: 'search...',
                    label: const Text('Search')),
              ),
            ),
          ),
          Container(
            height: 540,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 22, 53, 99),
            ),
            child: Container(
              height: 540,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80))),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 22, 53, 99),
                    ),
                  ),
                  Container(
                    height: 545,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(80))),
                  ),
                  Positioned(
                    top: 80,
                    child: Container(
                      height: 517,
                      width: 550,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 0.5,
                                  childAspectRatio: 5.0),
                          itemBuilder: (context, index) {
                            return  Container();
                              //CardPage(medicine: MedicineModel(), onSelectedMedicine: (int medId) {  },);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
