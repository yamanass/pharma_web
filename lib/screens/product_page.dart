import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/screens/product_information.dart';
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
      // final tokenWathcer = ref.watch(tokenProvider);
      // final medicineDetailsWatcher = await ref
      //     .watch(medicineProvider)
      //     .getAllMedicine(tokenWathcer.toString(), id);
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
      );
    }
    return  Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 67, 201, 201),
      ),
      body: Column(
        children: [
          Image(image: AssetImage("assets/images/Online_pharmacy.png"),
          width: 250,
              height: 250,),
          Expanded(child: content)
        ],
      ),
    );
  }
}
