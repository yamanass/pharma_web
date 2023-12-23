import 'package:flutter/material.dart';
import 'package:pharma_web/screens/card_page.dart';
import 'package:pharma_web/screens/search3.dart';

class product extends StatelessWidget {
  const product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Stack(
          // clipBehavior: Clip.none,
          //alignment: Alignment.center,
          // children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1000),
                  bottomRight: Radius.circular(1000)),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 22, 53, 99),
                  Color.fromARGB(255, 22, 53, 99),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Text(
                    'The Medicens',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  Text(
                    'Herbs',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //     top: 130,
          //     child: Row(
          //       children: [
          //         Image(
          //           image:
          //               AssetImage('image/image/IMG-20231123-WA0004.jpg'),
          //           height: 150,
          //           width: 230,
          //         ),
          //       ],
          //     )),
          // ],
          //),
          SizedBox(
            height: 90,
          ),
          Container(
            height: 400,
            width: 600,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 0.5,
                    childAspectRatio: 5.0),
                itemBuilder: (context, index) {
                  return CardPage();
                }),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 22, 53, 99),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Search3();
                      }));
                    },
                    icon: Icon(Icons.search),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
