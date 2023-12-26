import 'package:flutter/material.dart';
import 'package:pharma_web/models/order_bucket.dart';
import 'package:pharma_web/utils/kcolors_utils.dart';

import 'package:pharma_web/widgets/chart/chart_bar.dart';

import '../../models/order.dart';


class Chart extends StatelessWidget {
  const Chart({super.key, required this.orders});

  final List<Order> orders;

  List<OrderBucket> get buckets {
    return [
      OrderBucket.forCategory(orders, 1),
      OrderBucket.forCategory(orders, 2),
      OrderBucket.forCategory(orders, 3),
      OrderBucket.forCategory(orders, 5),
      OrderBucket.forCategory(orders, 6),
      OrderBucket.forCategory(orders, 7),
      OrderBucket.forCategory(orders, 8),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
     // margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [

            Color.fromARGB(255, 155, 217, 217),
            Kblue2,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Icon(Icons.account_circle_sharp),
                      Text("User  ${bucket.userId}"),
                    ],
                  ),
                ),
              ),
            )
                .toList(),
          )
        ],
      ),
    );
  }
}