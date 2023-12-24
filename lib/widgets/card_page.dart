import 'package:flutter/material.dart';
import 'package:pharma_web/screens/product_information.dart';

import '../models/medicine.dart';

class CardPage extends StatelessWidget {
   CardPage({super.key, required this.medicine, required this.onSelectedMedicine});
  final MedicineModel medicine;
  final Function(int medId) onSelectedMedicine;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return ProductInformation();
            // }));
          },
          child: Container(
            width: 150,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient:const LinearGradient(
                    colors: [Color.fromARGB(255, 43, 116, 225), Colors.white],
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(medicine.commercial_name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(medicine.cost.toString()),
                        ],
                      )
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
