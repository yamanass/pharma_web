import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:riverpod/riverpod.dart';

import '../models/medicine.dart';

class AllMedicineService {
  Future<List<MedicineModel>> getAllMedicine(String token, int id) async {
    print('hello medicine 1');

    http.Response response = await http.get(
        Uri.parse("http://127.0.0.1:8000/api/admin/getProduct"),
        headers: {'Authorization': 'Bearer $token'});
    print(response.statusCode);
    print('hello2');
    List<dynamic> data = jsonDecode(response.body);

    print('hello3');
    List<MedicineModel> medicineList = [];
    print('hello4');
    for (int i = 0; i < data.length; i++) {
      print(MedicineModel.fromJson(data[i]).category_id);
      if ((MedicineModel.fromJson(data[i]).category_id) == id) {
        medicineList.add(
          MedicineModel.fromJson(data[i]),
        );
        //print(data[i].toString());
      }
    }
    Set<String> name={};
    List <MedicineModel> nondupMedicineList=[];
    for(var e in medicineList){
      if(!name.contains(e.commercial_name)){
        nondupMedicineList.add(e);
        name.add(e.commercial_name);
      }

    }
    return nondupMedicineList;
  }
}

final medicineProvider =
    Provider<AllMedicineService>((ref) => AllMedicineService());
