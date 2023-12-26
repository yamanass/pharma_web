import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/screens/product_information.dart';
import 'package:pharma_web/utils/kcolors_utils.dart';
import 'package:pharma_web/widgets/card_page.dart';
import 'package:pharma_web/screens/search3.dart';
import 'package:pharma_web/widgets/medicine_item.dart';

import '../models/medicine.dart';
import '../providers/auth_data_provider.dart';
import '../services/get_medicine_service.dart';

class ProductPage extends ConsumerWidget {
   ProductPage({super.key, required this.title, required this.medicines});
  final String title;
  List<MedicineModel> medicines;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void _selectMedicine(MedicineModel medicine, int id, WidgetRef ref) async {

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => ProductInformation(medicine: medicine),
        ),
      );
    }
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );

    if (medicines.isNotEmpty) {
      content = Center(
        child: Container(
          width:  500,
          child: Expanded(
            child: ListView.builder(
              itemCount: medicines.length,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              itemBuilder: (ctx, index) =>
                  // Text(medicines[index].commercial_name)
                  MedicineItem(
                medicine:medicines[index],
                onSelectedMedicine: (int id) {
                 _selectMedicine(medicines[index], id, ref);
                },
                // onSelectedMedicine: _selectMedicine(context),
              ),
            ),
          ),
        ),
      );
    }
    return  Scaffold(
      // backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 67, 201, 201),
      ),
      body: Column(
        children: [
          Stack(

            children: [
              ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: Color.fromARGB(255, 179, 250, 250),
                    height: 170,
                  )),
              ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color:  Color.fromARGB(255, 67, 201, 201),
                    height: 150,
                  )),


            ],
          ),
        Image(image: AssetImage("assets/images/Online_pharmacy.png"),
          width: 250,
              height: 250,),

          Expanded(child: content)
        ],
      ),
    );
  }
}
class WaveClipper extends CustomClipper<Path> {
  var path = Path();
  @override
  Path getClip(Size size) {
    //debugPrint(size.width.toString());

    path.lineTo(0, size.height);

    path.quadraticBezierTo(size.width * 0.25, size.height - 200,
        size.width * 0.5, size.height - 100);
    path.quadraticBezierTo(
        size.width * 0.8, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}