import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/order.dart';
import '../widgets/order_details.dart';

class ReportPage extends ConsumerWidget {
  ReportPage({super.key, required this.orders, required this.totalEarnings});
  List<Order> orders;
  double totalEarnings;



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        // backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Text("Report Deatails"),
          backgroundColor: Color.fromARGB(255, 67, 201, 201),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/back.jpg'), // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              height: 500,
              width: 500,
              child: Column(
                children: [
                  Text("Total Orders Number: ${orders.length}"),
                  SizedBox(height:  20,),
                  Text("Total Orders Earnings: ${totalEarnings}"),
                  SizedBox(height:  20,),
                Text("Total Orders :"),
                  Expanded(
                    child: ListView.builder(
                        itemCount: orders.length,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        itemBuilder: (ctx, index) =>ListTile(
                        title: Text("Order Id: ${orders[index].id}"),
                          subtitle: Text("Order Price ${orders[index].orderPrice}"),
                        )
                    ),
                  ),
                ],
              ),

            ),
          ),
        ));
  }
}
