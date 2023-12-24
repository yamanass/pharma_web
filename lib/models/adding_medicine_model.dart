import 'dart:convert';

import '../widgets/date_time.dart';
/// category_id : "3"
/// scientific_name : "pa"
/// commercial_name : "kal"
/// company : "jk"
/// quantity_available : "5"
/// createdat : "2023/12/07"
/// cost : "2345"


AddingMedicineModel addingMedicineModelFromJson(String str) => AddingMedicineModel.fromJson(json.decode(str));
String addingMedicineModelToJson(AddingMedicineModel data) => json.encode(data.toJson());
class AddingMedicineModel {
  AddingMedicineModel({
      int? categoryId,
      String? scientificName, 
      String? commercialName, 
      String? company, 
      String? quantityAvailable, 
      DateTime? createdat,
      String? cost,}){
    _categoryId = categoryId;
    _scientificName = scientificName;
    _commercialName = commercialName;
    _company = company;
    _quantityAvailable = quantityAvailable;
    _createdat = createdat;
    _cost = cost;
}

  AddingMedicineModel.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _scientificName = json['scientific_name'];
    _commercialName = json['commercial_name'];
    _company = json['company'];
    _quantityAvailable = json['quantity_available'];
    _createdat = json['createdat'];
    _cost = json['cost'];
  }
  int? _categoryId;
  String? _scientificName;
  String? _commercialName;
  String? _company;
  String? _quantityAvailable;
  DateTime? _createdat;
  String? _cost;
AddingMedicineModel copyWith({  int? categoryId,
  String? scientificName,
  String? commercialName,
  String? company,
  String? quantityAvailable,
 DateTime? createdat,
  String? cost,
}) => AddingMedicineModel(  categoryId: categoryId ?? _categoryId,
  scientificName: scientificName ?? _scientificName,
  commercialName: commercialName ?? _commercialName,
  company: company ?? _company,
  quantityAvailable: quantityAvailable ?? _quantityAvailable,
  createdat: createdat ?? _createdat,
  cost: cost ?? _cost,
);
 int? get categoryId => _categoryId;
  String? get scientificName => _scientificName;
  String? get commercialName => _commercialName;
  String? get company => _company;
  String? get quantityAvailable => _quantityAvailable;
  DateTime? get createdat => _createdat;
  String? get cost => _cost;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['scientific_name'] = _scientificName;
    map['commercial_name'] = _commercialName;
    map['company'] = _company;
    map['quantity_available'] = _quantityAvailable;
    String date= _createdat!.year.toString()  + "/" + _createdat!.month.toString() + "/" + _createdat!.day.toString();
    map['createdat'] =date;
    map['cost'] = _cost;
    return map;
  }

}