import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/models/medicine.dart';

import '../providers/user_provider.dart';

class ProductInformation extends ConsumerWidget {
  ProductInformation({Key? key, required this.medicine}) : super(key: key);

  final MedicineModel medicine;

  String truncateText(String text, int maxLength) {
    return text.length <= maxLength ? text : text.substring(0, maxLength) + '...';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(userProvider)!.name!),
        backgroundColor: const Color.fromARGB(355, 70, 201, 210),
      ),
      backgroundColor: Color.fromARGB(355, 67, 201, 201),
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
                      image: AssetImage('assets/images/photo_2023-12-21_01-32-44.jpg'),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Medicine Name',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            truncateText(medicine.commercial_name.toString(), 35),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Price',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$${medicine.cost.toString()}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Scientific Name',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            truncateText(medicine.scientific_name.toString(), 35),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Company',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            truncateText(medicine.company.toString(), 35),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Expiration Date',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            truncateText(medicine.createdat.toString(), 35),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Quantity',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            truncateText(medicine.quantity_available.toString(), 35),
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
