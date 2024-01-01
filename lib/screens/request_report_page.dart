import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/data/rerquest_report.dart';
import 'package:pharma_web/providers/auth_data_provider.dart';
import 'package:pharma_web/screens/report_screen.dart';
import 'package:pharma_web/services/request_report_service.dart';
import '../widgets/date_time.dart';

class RequestReport extends ConsumerWidget {
  const RequestReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    _onRequest(BuildContext context) async{
        final tokenReader= ref.read(tokenProvider);
          double tot=0;

        final orders= await RequestReportService().requestReport(firstChosenDate, lastChosenDate, tokenReader!.toString());
        for(var e in orders){
          tot+=e.orderPrice!.toDouble();
        }
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ReportPage(orders: orders, totalEarnings:  tot,)));
        

    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Enter the first date"),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: PickDateWidget(
              initialDate: DateTime.now(),
              lastDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 20,
                  DateTime.now().month, DateTime.now().day),
              isForAdd: false,
              isLast: false,
            ),
          ),

          SizedBox(height: 20),
          Text("Enter the last date"),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: PickDateWidget(
              initialDate: DateTime.now(),
              lastDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 20,
                  DateTime.now().month, DateTime.now().day),
              isForAdd: false,
              isLast: true,
            ),
          ),
          SizedBox(height:  20,),
          Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
                color:const Color.fromARGB(255, 70, 201, 210),
                borderRadius: BorderRadius.circular(13)),
            child: MaterialButton(
              onPressed: () async {
                _onRequest(context);
              },

              child: Text(
                "Request",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )

        ],
      ),
    );
  }
}
