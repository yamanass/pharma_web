import 'dart:convert';

import 'package:pharma_web/models/product_model.dart';
/// id : 1
/// user_id : 1
/// status : "In_Preparation"
/// payment_status : "not_paid"
/// order_price : 500
/// created_at : "2023-12-26T11:45:11.000000Z"
/// updated_at : "2023-12-26T11:45:11.000000Z"
/// products : []

Order orderFromJson(String str) => Order.fromJson(json.decode(str));
String orderToJson(Order data) => json.encode(data.toJson());
class Order {
  Order({
      num? id, 
      num? userId, 
      String? status, 
      String? paymentStatus, 
      num? orderPrice, 
      String? createdAt, 
      String? updatedAt, 
      List<dynamic>? products,}){
    _id = id;
    _userId = userId;
    _status = status;
    _paymentStatus = paymentStatus;
    _orderPrice = orderPrice;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _products = products;
}

  Order.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _status = json['status'];
    _paymentStatus = json['payment_status'];
    _orderPrice = json['order_price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ProductModel.fromJson(v));
      });
    }
  }
  num? _id;
  num? _userId;
  String? _status;
  String? _paymentStatus;
  num? _orderPrice;
  String? _createdAt;
  String? _updatedAt;
  List<dynamic>? _products;
Order copyWith({  num? id,
  num? userId,
  String? status,
  String? paymentStatus,
  num? orderPrice,
  String? createdAt,
  String? updatedAt,
  List<dynamic>? products,
}) => Order(  id: id ?? _id,
  userId: userId ?? _userId,
  status: status ?? _status,
  paymentStatus: paymentStatus ?? _paymentStatus,
  orderPrice: orderPrice ?? _orderPrice,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  products: products ?? _products,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get status => _status;
  String? get paymentStatus => _paymentStatus;
  num? get orderPrice => _orderPrice;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<dynamic>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['status'] = _status;
    map['payment_status'] = _paymentStatus;
    map['order_price'] = _orderPrice;
    // map['created_at'] = _createdAt;
    // map['updated_at'] = _updatedAt;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}