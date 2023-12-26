import 'package:pharma_web/models/category/category_model.dart';

import 'order.dart';

class OrderBucket{
  const OrderBucket({required this.userId, required this.orders});

  OrderBucket.forCategory(List<Order> allOrders,this.userId)
      : orders = allOrders.where((order) => order.userId== userId)
      .toList();

  final int userId;
  final List<Order> orders;
  double get totalExpenses{
    double sum =0;
    for(final order in orders){
      sum+=order.products!.length;
    }
    return sum;
  }
}