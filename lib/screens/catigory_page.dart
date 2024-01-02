import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/providers/user_provider.dart';
import 'package:pharma_web/screens/medicin_form.dart';
import 'package:pharma_web/screens/product_information.dart';
import 'package:pharma_web/screens/product_page.dart';
import 'package:pharma_web/widgets/category/category_grid_item.dart';
import 'package:pharma_web/widgets/category/catigory_form.dart';
import 'package:pharma_web/widgets/textfield_search.dart';

import '../models/category/category_model.dart';
import '../providers/auth_data_provider.dart';
import '../services/get_categories_service.dart';
import '../services/get_medicine_service.dart';

class catigorypage extends ConsumerStatefulWidget {
  catigorypage({super.key});

  @override
  ConsumerState<catigorypage> createState() => _catigorypageState();
}

class _catigorypageState extends ConsumerState<catigorypage> {
  void _selectCategory(CategoryModel category, int id, WidgetRef ref) async {
    final tokenWathcer = ref.watch(tokenProvider);

    final medicineWatcher = await ref
        .watch(medicineProvider)
        .getAllMedicine(tokenWathcer.toString(), id);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ProductPage(
          title: category.name,
          medicines: medicineWatcher,
        ),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final tokenReader = ref.read(tokenProvider);
    return Scaffold(
        body: Column(children: [
      const Image(
        image: AssetImage('assets/images/512f06b0b6bedab32d0ab0c572ad65bd.jpg'),
        width: double.infinity,
        height: 270,
      ),
      SizedBox(
        height: 10,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: FutureBuilder<List<CategoryModel>>(
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
        ),
      ),
    ]));
  }
}
