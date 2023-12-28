import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:riverpod/riverpod.dart';

import '../models/medicine.dart';

class ExpirationService {
  Future<List<MedicineModel>> refreshExpiration(String token) async {

    http.Response response = await http.get(
        Uri.parse("http://127.0.0.1:8000/api/admin/expiration"),
        headers: {'Authorization': 'Bearer $token'});

    List<dynamic> data = jsonDecode(response.body)["expiration"];


    List<MedicineModel> medicineList = [];

    for (int i = 0; i < data.length; i++) {

        medicineList.add(
          MedicineModel.fromJson(data[i]),
        );

    }
    return medicineList;
  }
  Future<List<MedicineModel>> allExpiration(String token) async {

    http.Response response = await http.get(
        Uri.parse("http://127.0.0.1:8000/api/admin/all_expiration"),
        headers: {'Authorization': 'Bearer $token'});

    List<dynamic> data = jsonDecode(response.body)["data"];


    List<MedicineModel> medicineList = [];

    for (int i = 0; i < data.length; i++) {

      medicineList.add(
        MedicineModel.fromJson(data[i]),
      );

    }
    return medicineList;
  }
  Future<bool> deleteAllExpiration(String token) async {

    http.Response response = await http.get(
        Uri.parse("http://127.0.0.1:8000/api/admin/delet_expiration"),
        headers: {'Authorization': 'Bearer $token'});



    List<MedicineModel> medicineList = [];

    return response.statusCode ==200;

  }
}

final expirationProvider =
Provider<ExpirationService>((ref) => ExpirationService());


