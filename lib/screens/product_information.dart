import 'package:flutter/material.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xfff5f5f5)),
        child: Container(
          child: Stack(
            children: [
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1, top: 1),
                    child: Image(
                      image: AssetImage(
                          'assets/images/photo_2023-12-21_01-32-44.jpg'),
                      height: double.infinity,
                      width: 700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170),
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 115),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '- Scientific name',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '- Trede name',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '- Category',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(),
                            child: Text(
                              '- Expiry date',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '- Quantiy',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '- Company',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
