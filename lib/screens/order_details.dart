import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/models/order.dart';
import 'package:pharma_web/models/product_model.dart';
import 'package:pharma_web/providers/auth_data_provider.dart';
import 'package:pharma_web/screens/main_page.dart';
import 'package:pharma_web/screens/product_page.dart';
import 'package:pharma_web/services/change_payment_status.dart';
import 'package:pharma_web/services/change_status_service.dart';
import 'package:pharma_web/widgets/change_status_button.dart';
import 'package:pharma_web/widgets/order_details.dart';

class OrderDetailsPage extends ConsumerWidget {
  OrderDetailsPage({super.key, required this.order});
  void changeStatus(Order order, BuildContext context, String token) async{
    int temp= order.status=="In_Preparation"?1:2;
    bool sucsess=await ChangeStatus().setStatus(temp, order.id!.toInt(), token,order.userId!.toInt());
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return AlertDialog(
        title: Text(sucsess?'The status changed sucsessfuly ': ' Some errors hepaned please tye again'),
        content: Text(sucsess?'you user can see changes now  ': 'error occcurred'),
        actions: [
          TextButton(
            onPressed: () {

              Navigator.pop(context);
              Navigator.pop(context);

            },
            child: Text('OK'),
          ),
        ],
      );
    },);
  }
  void changePaymentStatus(Order order,BuildContext context, String token,) async{

   bool sucsess= await ChangePaymentStatus().setPaymentStatus(1, order.id!.toInt(), token);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(sucsess?'The payment status changed sucsessfuly ': ' Some errors hepaned please tye again'),
          content: Text(sucsess?'you user can see changes now ': 'error occcurred'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },);
  }
  Order order;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenReader = ref.read(tokenProvider);
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
                  ChangeStatusButton(explanation: order.status!="Received"?"Press to change tha status: ": "Final status: ",
                      status: order.status!, onChange: (){
                        if(order.status!="Received") {
                          changeStatus(order,context, tokenReader.toString());
                        }
                      }),
                  SizedBox(height: 10,),
                  ChangeStatusButton(explanation: order.paymentStatus!="paid"?"Press to Change the Payment Status: ": "Final status: ",
                      status: order.paymentStatus!, onChange: (){
                        if(order.paymentStatus!="paid") {
                          changePaymentStatus(order, context, tokenReader.toString());
                        }}),


                ],
              ),
            ),
          ),
        ));
  }
}
