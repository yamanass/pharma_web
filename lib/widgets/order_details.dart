import 'package:flutter/material.dart';

import '../models/order.dart';

class OrderInfo extends StatelessWidget {
  OrderInfo({super.key, required this.order});
    Order order;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order ID',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const  SizedBox(height: 5),
        Text(
          order.id.toString(),
          //medicine.name.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const  SizedBox(height: 15),
        const Text(
          'User ID',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '${order.userId}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        //Scientific name
        const Text(
          'Order Price',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "${order.orderPrice.toString()}\$",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        //Company Name
        const SizedBox(height: 5),



      ],
    );
  }
}
