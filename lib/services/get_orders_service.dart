import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:riverpod/riverpod.dart';

import '../models/order.dart';

class AllOrdersService {
  Future<List<Order>> getAllOrders(String token) async {


    http.Response response = await http.get(
        Uri.parse("http://127.0.0.1:8000/api/admin/getOrderDetails"),
        headers: {'Authorization': 'Bearer $token'});

    List<dynamic> data = jsonDecode(response.body)['data'];


    List<Order> orderList = [];

    for (int i = 0; i < data.length; i++) {

        orderList.add(
          Order.fromJson(data[i]),
        );


    }
    return orderList;
  }
}

final medicineProvider =
Provider<AllOrdersService>((ref) => AllOrdersService());
