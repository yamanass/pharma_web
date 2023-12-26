import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/models/order.dart';
import 'package:pharma_web/models/product_model.dart';
import 'package:pharma_web/screens/product_page.dart';
import 'package:pharma_web/widgets/order_details.dart';

class OrderDataisPage extends ConsumerWidget {
  OrderDataisPage({super.key, required this.order});

  Order order;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        // backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Text("Order Datails"),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                         // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            OrderInfo(order: order),
                          ],
                        ),
                      ),
                      Expanded(

                        child: Container(
                          height: 500,
                          width: 200,
                          child: ListView.builder(
                           // scrollDirection: Axis.horizontal,
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),

                            itemCount: order.products!.length+1,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            itemBuilder: (ctx, index) => Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Center(
                                child: index==0?  const Text(
                                  'Products',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                                :Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${(order.products![index-1] as ProductModel).commercialName.toString()}  ${(order.products![index-1] as ProductModel).pivot!.quantity.toString()   }",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  ElevatedButton(onPressed: (){}, child: Text("press")),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){}, child: Text("press"))
                ],
              ),
            ),
          ),
        ));
  }
}
