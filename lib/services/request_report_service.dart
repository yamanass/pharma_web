import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pharma_web/models/adding_medicine_model.dart';
import 'package:pharma_web/models/auth/login.dart';


import 'dart:convert';

import '../models/order.dart';


class RequestReportService {


  Future<List<Order>> requestReport(DateTime firstDate, DateTime lastDate, String token) async {
    final url = Uri.parse("http://127.0.0.1:8000/api/admin/showpayement");
    // print(login.toJson());
    String fDate= firstDate!.year.toString()  + "/" + firstDate!.month.toString() + "/" + firstDate!.day.toString();
    String lDate= lastDate!.year.toString()  + "/" + lastDate!.month.toString() + "/" + lastDate!.day.toString();

    var body = {
      'timeE': '$fDate ',
      'timeF': '$lDate '
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
    print(" the repoooort request${response.body}");
    print(response.statusCode);
    List<dynamic> data = jsonDecode(response.body)['data'];


    List<Order> orderList = [];

    for (int i = 0; i < data.length; i++) {

      orderList.add(
        Order.fromJson(data[i]),
      );}
    return orderList;

  }

}


