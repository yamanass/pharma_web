import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_web/models/adding_medicine_model.dart';
import 'package:pharma_web/models/auth/login.dart';


import 'dart:convert';


class AddProductService {


  Future<int> insertProduct(AddingMedicineModel medicine, String token) async {
    final url = Uri.parse("http://127.0.0.1:8000/api/admin/InsertProduct");
   // print(login.toJson());
    final response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer 5|6ZCNS7lAUNZXc9ZCUhc7tdVKoyHiXlYl3brnrCdk3e1cd11b',
        'Content-Type': 'application/json',
      },
      body: json.encode(medicine.toJson()),
    );
    print(response.body);
    print(response.statusCode);
    return response.statusCode;

  }

  Future<int> deleteToken(String token) async {
    final url = "http://127.0.0.1:8000/api/admin/logout";
    final response = await http.post(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to logout');
    }
  }
}


