import 'package:flutter/material.dart';

import '../../models/category/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({required this.category,
  super.key,
  //required this.category,
  required this.onSelectedCategory,
});

CategoryModel category;
//final Category category;
final Function(int id) onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectedCategory(category.id);
      },
      child: Container(
        constraints: BoxConstraints(maxHeight: 70, maxWidth: 70),
        decoration:const  BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 43, 116, 225), Colors.white]),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 43, 116, 225),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Text(category.name),
      ),
    );
  }
}
