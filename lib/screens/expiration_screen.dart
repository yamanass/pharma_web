import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/models/medicine.dart';
import 'package:pharma_web/models/product_model.dart';
import 'package:pharma_web/services/get_medicine_service.dart';
import 'package:pharma_web/services/refresh_expiration_service.dart';
import 'package:pharma_web/widgets/medicine_item.dart';
import 'package:pharma_web/widgets/search/expired_items.dart';

import '../providers/auth_data_provider.dart';

class Expiration extends ConsumerStatefulWidget {
  const Expiration({super.key});

  @override
  ConsumerState<Expiration> createState() => _ExpirationState();
}

class _ExpirationState extends ConsumerState<Expiration> {

  void deleteAll(String token, WidgetRef ref) async{
    final expirationWatcher =ref.watch(expirationProvider);
     var areDeleted= await ExpirationService().deleteAllExpiration(token);
     showDialog(
       context: context,
       builder: (BuildContext context) {
         return AlertDialog(
           title: Text(areDeleted?'The expiration deleted sucsessfuly ': ' Some errors hepaned please tye again'),
           content: Text(areDeleted?'All products are uptodate now  ': 'error occcurred'),
           actions: [
             TextButton(
               onPressed: () async {
              await expirationWatcher.allExpiration(token);
                 Navigator.pop(context);


               },
               child: Text('OK'),
             ),
           ],
         );
       },);
  }
  bool refresh= false;
  @override
  Widget build(BuildContext context) {
    final tokenReader = ref.read(tokenProvider);
    final expirationWatcher =ref.watch(expirationProvider);
    return  Column(
        children: [
          Text("Newly Expired Items:"),
          Container(
             child: refresh?Expanded(
               child: FutureBuilder<List<MedicineModel>>(
                  future: ExpirationService().refreshExpiration(tokenReader.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MedicineModel> medicines = snapshot.data!;
                      return Container(
                        child: medicines.length>0?GridView.builder(
                            itemCount: medicines.length,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 1.5,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemBuilder: (context, index) {
                              return LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  // Set your desired maximum width
                                  double maxWidth = 70.0;

                                  // Calculate the actual width based on the constraints
                                  double actualWidth = constraints.maxWidth > maxWidth
                                      ? maxWidth
                                      : constraints.maxWidth;
                                  return Container(
                                    constraints:
                                    BoxConstraints(maxWidth: actualWidth),
                                    child: MedicineItem(
                                      medicine: medicines[index],
                                      onSelectedMedicine: (int id) {
                                        //_selectCategory(categories[index], id, ref);
                                      },
                                    ),
                                  );
                                },
                              );
                            }) : Center(child: const Text("No newly expired items")),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
             ): Center(child: Text("No Items yet , refresh to malke shure")),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              refresh=true;
            });
          }, child: Text("Refresh")),
          const Divider(),
          Text("All Expired Items:"),
         ExpiredItems(),
          ElevatedButton(onPressed: (){
                deleteAll(tokenReader.toString(), ref);
          }, child: Text("Delete All")),
          SizedBox(height: 20,)

        ],
    );
  }
}
