import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/screens/order_details.dart';
import 'package:pharma_web/services/get_orders_service.dart';
import 'package:pharma_web/widgets/chart/chartt.dart';

import '../models/order.dart';
import '../providers/auth_data_provider.dart';
import '../widgets/category/category_grid_item.dart';

class OrdersPage extends ConsumerStatefulWidget {
  OrdersPage({super.key, this.back});

  bool? back;

  @override
  ConsumerState<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set up a timer to periodically refresh the data
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Trigger a rebuild of the widget
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokenReader = ref.read(tokenProvider);
    return FutureBuilder<List<Order>>(
      future: AllOrdersService().getAllOrders(tokenReader.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Order> orders = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Chart(orders: orders),
                SizedBox(height: 10,),
                Expanded(
                  child: GridView.builder(
                    itemCount: orders.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3.7,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color.fromARGB(255, 201, 210, 208),
                        child: ListTile(
                          leading: Icon(Icons.today_outlined),
                          title: Text("Order ID: ${orders[index].id}"),
                          subtitle: Text("User ID: ${orders[index].userId}"),
                          trailing: TextButton(
                            child: Text(orders[index].status.toString()),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => OrderDetailsPage(order: orders[index])));
                            },
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => OrderDetailsPage(order: orders[index])));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
