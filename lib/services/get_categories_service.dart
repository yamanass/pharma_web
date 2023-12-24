import 'dart:convert';
import 'package:http/http.dart' as http;


import '../models/category/category_model.dart';

class AllCategoryService {
  Future<List<CategoryModel>> getAllCategory(String token) async {


    http.Response response = await http.get(
        Uri.parse("http://127.0.0.1:8000/api/admin/getCategories"),
        headers: {'Authorization': 'Bearer $token'});

    List<dynamic> data = jsonDecode(response.body);

    List<CategoryModel> categoryList = [];
    for (int i = 0; i < data.length; i++) {
      categoryList.add(
        CategoryModel.fromJson(data[i]),
      );

    }
    return categoryList;
  }
}
