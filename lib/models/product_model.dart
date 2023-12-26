import 'dart:convert';
/// id : 1
/// category_id : 1
/// scientific_name : "سيتامول"
/// commercial_name : "سيتامول"
/// company : "سيتا"
/// quantity_available : 100
/// createdat : "2023-12-17"
/// cost : 67
/// pivot : {"order_id":1,"product_id":1,"quantity":4}

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());
class ProductModel {
  ProductModel({
      num? id, 
      num? categoryId, 
      String? scientificName, 
      String? commercialName, 
      String? company, 
      num? quantityAvailable, 
      String? createdat, 
      num? cost, 
      Pivot? pivot,
        }){
    _id = id;
    _categoryId = categoryId;
    _scientificName = scientificName;
    _commercialName = commercialName;
    _company = company;
    _quantityAvailable = quantityAvailable;
    _createdat = createdat;
    _cost = cost;
    _pivot = pivot;


}

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _scientificName = json['scientific_name'];
    _commercialName = json['commercial_name'];
    _company = json['company'];
    _quantityAvailable = json['quantity_available'];
    _createdat = json['createdat'];
    _cost = json['cost'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  num? _id;
  num? _categoryId;
  String? _scientificName;
  String? _commercialName;
  String? _company;
  num? _quantityAvailable;
  String? _createdat;
  num? _cost;
  Pivot? _pivot;
  int? _quantity;
ProductModel copyWith({  num? id,
  num? categoryId,
  String? scientificName,
  String? commercialName,
  String? company,
  num? quantityAvailable,
  String? createdat,
  num? cost,
  Pivot? pivot,
}) => ProductModel(  id: id ?? _id,
  categoryId: categoryId ?? _categoryId,
  scientificName: scientificName ?? _scientificName,
  commercialName: commercialName ?? _commercialName,
  company: company ?? _company,
  quantityAvailable: quantityAvailable ?? _quantityAvailable,
  createdat: createdat ?? _createdat,
  cost: cost ?? _cost,
  pivot: pivot ?? _pivot,
);
  num? get id => _id;
  num? get categoryId => _categoryId;
  String? get scientificName => _scientificName;
  String? get commercialName => _commercialName;
  String? get company => _company;
  num? get quantityAvailable => _quantityAvailable;
  String? get createdat => _createdat;
  num? get cost => _cost;
  Pivot? get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['scientific_name'] = _scientificName;
    map['commercial_name'] = _commercialName;
    map['company'] = _company;
    map['quantity_available'] = _quantityAvailable;
    map['createdat'] = _createdat;
    map['cost'] = _cost;
    if (_pivot != null) {
      map['quantity'] = _pivot?.toJson()['quantity'];
    }
    return map;
  }

}

/// order_id : 1
/// product_id : 1
/// quantity : 4

Pivot pivotFromJson(String str) => Pivot.fromJson(json.decode(str));
String pivotToJson(Pivot data) => json.encode(data.toJson());
class Pivot {
  Pivot({
      num? orderId, 
      num? productId, 
      num? quantity,}){
    _orderId = orderId;
    _productId = productId;
    _quantity = quantity;
}

  Pivot.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _productId = json['product_id'];
    _quantity = json['quantity'];
  }
  num? _orderId;
  num? _productId;
  num? _quantity;
Pivot copyWith({  num? orderId,
  num? productId,
  num? quantity,
}) => Pivot(  orderId: orderId ?? _orderId,
  productId: productId ?? _productId,
  quantity: quantity ?? _quantity,
);
  num? get orderId => _orderId;
  num? get productId => _productId;
  num? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['product_id'] = _productId;
    map['quantity'] = _quantity;
    return map;
  }

}