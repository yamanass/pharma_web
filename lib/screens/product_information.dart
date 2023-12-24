import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/models/medicine.dart';

import '../providers/user_provider.dart';

class ProductInformation extends ConsumerWidget {
 ProductInformation({super.key, required this.medicine});
  MedicineModel medicine;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title:Text (ref.watch(userProvider)!.name!
            ),
        backgroundColor: const Color.fromARGB(255, 70, 201, 210),
      ),
      backgroundColor: Color.fromARGB(255, 67, 201, 201),
      body: Container(

        decoration: BoxDecoration(color: Color(0xfff5f5f5)),
        child: Container(
          child: Stack(
            children: [
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1, top: 1),
                    child: Image(
                      image: AssetImage(
                          'assets/images/photo_2023-12-21_01-32-44.jpg'),
                      height: double.infinity,
                      width: 700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170),
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 115),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Medicine Name',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const  SizedBox(height: 5),
                          Text(
                            medicine.commercial_name.toString(),
                            //medicine.name.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const  SizedBox(height: 15),
                          const Text(
                            'Price',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${medicine.cost.toString()}\$',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          //Scientific name
                          const Text(
                            'Scientific Name',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            medicine.scientific_name.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //Company Name
                          const SizedBox(height: 15),
                          Text(
                            'Company',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            medicine.company.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
