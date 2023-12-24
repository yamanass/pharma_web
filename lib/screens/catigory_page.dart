import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/providers/user_provider.dart';
import 'package:pharma_web/screens/medicin_form.dart';
import 'package:pharma_web/screens/product_page.dart';
import 'package:pharma_web/widgets/category_grid_item.dart';
import 'package:pharma_web/widgets/catigory_form.dart';
import 'package:pharma_web/widgets/textfield_search.dart';

import '../models/category/category_model.dart';
import '../providers/auth_data_provider.dart';
import '../services/get_categories_service.dart';

class catigorypage extends ConsumerStatefulWidget {
 catigorypage({super.key});

  @override
  ConsumerState<catigorypage> createState() => _catigorypageState();
}

class _catigorypageState extends ConsumerState<catigorypage> {
 void _selectCategory(CategoryModel category, int id, WidgetRef ref) async {
   final tokenWathcer = ref.watch(tokenProvider);

   // final medicineWatcher = await ref
   //     .watch(medicineProvider)
   //     .getAllMedicine(tokenWathcer.toString(), id);
   // Navigator.of(context).push(
   //   MaterialPageRoute(
   //     builder: (ctx) => ProductInformation(
   //       title: category.name,
   //       medicines: medicineWatcher,
   //     ),
   //   ),
   // );
 }

  @override
  Widget build(BuildContext context, ) {
    final tokenReader = ref.read(tokenProvider);
    return Scaffold(

        body: Column(children: [

      const Image(
        image: AssetImage('assets/images/0ba76cee7ec19e0a432d2fca798f9a44.jpg'),
        width: double.infinity,
        height: 300,
      ),
      SizedBox(
        height: 5,
      ),
      Container(

    child: Text(
    'Your Categories',
    textAlign: TextAlign.start,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
    ),
    ),
      Expanded(
      //  height: 200,
       // padding: EdgeInsets.symmetric(horizontal: 15),
        child:
        FutureBuilder<List<CategoryModel>>(
          future: AllCategoryService().getAllCategory(tokenReader.toString()),
          builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CategoryModel> categories = snapshot.data!;
          return Container(
            child: GridView.builder(
                itemCount: categories.length,
               // clipBehavior: Clip.none,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                 childAspectRatio: 1.5,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {

                  return LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      // Set your desired maximum width
                      double maxWidth = 70.0;

                      // Calculate the actual width based on the constraints
                      double actualWidth = constraints.maxWidth > maxWidth
                          ? maxWidth
                          : constraints.maxWidth;
                                  return  Container(
                                    constraints: BoxConstraints(maxWidth: actualWidth),
                                    child: CategoryGridItem(
                                      category: categories[index],
                                      onSelectedCategory: (int id) {
                                        _selectCategory(categories[index], id, ref);
                                      },
                                    ),
                                  );

                    },

                  );
                }),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
          },
        ),





        // ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: [
        //     GestureDetector(
        //       onTap: () {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //     builder: (BuildContext context) {
        //         //       return const Prodacts();
        //         //     },
        //         //   ),
        //         // );
        //       },
        //       child: cati_form(
        //         child: Center(
        //             child: Text(
        //           'catigory 7',
        //           style: TextStyle(fontSize: 30),
        //         )),
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 25,
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (BuildContext context) {
        //               return product();
        //             },
        //           ),
        //         );
        //       },
        //       child: cati_form(
        //         child: const Center(
        //             child: Text(
        //           'catigory 7',
        //           style: TextStyle(fontSize: 30),
        //         )),
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 25,
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //     builder: (BuildContext context) {
        //         //       return const Prodacts_3();
        //         //     },
        //         //   ),
        //         // );
        //       },
        //       child: GestureDetector(
        //         onTap: () {
        //           // Navigator.push(
        //           //   context,
        //           //   MaterialPageRoute(
        //           //     builder: (BuildContext context) {
        //           //       return const Prodacts_3();
        //           //     },
        //           //   ),
        //           // );
        //         },
        //         child: cati_form(
        //           child: const Center(
        //               child: Text(
        //             'catigory 7',
        //             style: TextStyle(fontSize: 30),
        //           )),
        //         ),
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 25,
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //     builder: (BuildContext context) {
        //         //       return const Prodacts_4();
        //         //     },
        //         //   ),
        //         // );
        //       },
        //       child: cati_form(
        //         child: const Center(
        //             child: Text(
        //           'catigory 7',
        //           style: TextStyle(fontSize: 30),
        //         )),
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 25,
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //     builder: (BuildContext context) {
        //         //       return const Prodacts_5();
        //         //     },
        //         //   ),
        //         // );
        //       },
        //       child: cati_form(
        //         child: const Center(
        //             child: Text(
        //           'catigory 7',
        //           style: TextStyle(fontSize: 30),
        //         )),
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 25,
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //     builder: (BuildContext context) {
        //         //       return const Prodacts_6();
        //         //     },
        //         //   ),
        //         // );
        //       },
        //       child: cati_form(
        //         child: const Center(
        //             child: Text(
        //           'catigory 7',
        //           style: TextStyle(fontSize: 30),
        //         )),
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 25,
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //     builder: (BuildContext context) {
        //         //       return const Prodacts_2();
        //         //     },
        //         //   ),
        //         // );
        //       },
        //       child: Container(
        //         width: 200,
        //         height: 150,
        //         decoration: const BoxDecoration(
        //           gradient: LinearGradient(colors: [
        //             Color.fromARGB(255, 43, 116, 225),
        //             Colors.white
        //           ]),
        //           borderRadius: BorderRadius.all(Radius.circular(30)),
        //           boxShadow: [
        //             BoxShadow(
        //               color: Color.fromARGB(255, 43, 116, 225),
        //               blurRadius: 20,
        //               offset: Offset(0, 10),
        //             ),
        //           ],
        //         ),
        //         child: const Center(
        //             child: Text(
        //           'catigory 7',
        //           style: TextStyle(fontSize: 30),
        //         )),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    ]));
  }
}
