import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/controllers/add_medicine_controller.dart';
import 'package:pharma_web/models/adding_medicine_model.dart';
import 'package:pharma_web/providers/auth_data_provider.dart';
import 'package:pharma_web/screens/main_page.dart';
import 'package:pharma_web/services/add_product_service.dart';
import 'package:pharma_web/widgets/category/category_drop.dart';
import 'package:pharma_web/widgets/date_time.dart';
import 'package:pharma_web/widgets/tex_form_midicin.dart';

class MedicinFormScreen extends ConsumerStatefulWidget {
  MedicinFormScreen({super.key});

  @override
  ConsumerState<MedicinFormScreen> createState() => _MedicinFormScreenState();
}

class _MedicinFormScreenState extends ConsumerState<MedicinFormScreen> {
  void onAddProduct(WidgetRef ref) async {
    final tokenReader = ref.read(tokenProvider);
    final medicine = AddingMedicineModel(
      commercialName: tradeNameCtr.text.toString(),
      scientificName: scientificNameCtr.text.toString(),
      createdat: chosenDate,
      categoryId: chosenCategory,
      company: companyNameCtr.text.toString(),
      cost: priceCtr.text.toString(),
      quantityAvailable: quantityCtr.text.toString(),
    );
    var response = await AddProductService()
        .insertProduct(medicine, tokenReader.toString());
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(response == 200
              ? 'The product added sucsessfuly '
              : ' Some errors hepaned please tye again'),
          content: Text(response == 200
              ? 'you can see it in the medicine screen '
              : 'error occcurred'),
          actions: [
            TextButton(
              onPressed: () {
                tradeNameCtr.clear();
                scientificNameCtr.clear();
                quantityCtr.clear();
                priceCtr.clear();
                companyNameCtr.clear();
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
                      TextFormMidicn(
                        labelText: "Enter the scientific name",
                        controller: scientificNameCtr,
                      ),
                      TextFormMidicn(
                          labelText: "Enter the trade name",
                          controller: tradeNameCtr),
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
                            Expanded(
                                child: PickDateWidget(
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 10,
                                  DateTime.now().month, DateTime.now().day),
                              isForAdd: true,
                                  isLast:  false,
                            ))
                          ],
                        ),
                      ),
                      TextFormMidicn(
                          labelText: "Enter the manufacturer name",
                          controller: companyNameCtr),
                      SizedBox(
                        width: 20,
                      ),
                      TextFormMidicn(
                          labelText: "Enter the available quantity",
                          controller: quantityCtr),
                      SizedBox(
                        width: 20,
                      ),
                      TextFormMidicn(
                          labelText: "Enter the price", controller: priceCtr),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 70, 201, 210),
                            borderRadius: BorderRadius.circular(13)),
                        child: MaterialButton(
                          onPressed: () async {
                            onAddProduct(ref);
                            print("rabeet");
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
                      SizedBox(
                        height: 20,
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
