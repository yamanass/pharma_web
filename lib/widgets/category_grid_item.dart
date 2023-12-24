import 'package:flutter/material.dart';
// import 'package:pharma/models/category.dart';
import 'package:pharma_web/models/category/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({
    required this.category,
    super.key,
    //required this.category,
    required this.onSelectedCategory,
  });

  CategoryModel category;
  //final Category category;
  final Function(int id) onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Card(

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsetsDirectional.symmetric(vertical: 7),
          color: Colors.greenAccent[100],
          child: InkWell(
            onTap: () {
              onSelectedCategory(category.id);
            },
            //splashColor: category.color,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 34,
              ),
              child: Text(
                category.name.toString(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                      //color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          )),
    );
  }
}
