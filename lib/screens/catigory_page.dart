import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma_web/providers/user_provider.dart';
import 'package:pharma_web/screens/medicin_form.dart';
import 'package:pharma_web/screens/product_page.dart';
import 'package:pharma_web/widgets/catigory_form.dart';
import 'package:pharma_web/widgets/textfield_search.dart';

class catigorypage extends ConsumerWidget {
 catigorypage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
       title:Text (ref.watch(userProvider)!.name! ),
      ),
        body: Container(
            child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            textfield_search(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromARGB(255, 43, 116, 225),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MedicinFormScreen();
                    }));
                  },
                  icon: Icon(Icons.add),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      const Image(
        image: AssetImage('assets/images/0ba76cee7ec19e0a432d2fca798f9a44.jpg'),
        width: double.infinity,
        height: 400,
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const Prodacts();
                //     },
                //   ),
                // );
              },
              child: cati_form(
                child: Center(
                    child: Text(
                  'catigory 7',
                  style: TextStyle(fontSize: 30),
                )),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return product();
                    },
                  ),
                );
              },
              child: cati_form(
                child: const Center(
                    child: Text(
                  'catigory 7',
                  style: TextStyle(fontSize: 30),
                )),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const Prodacts_3();
                //     },
                //   ),
                // );
              },
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) {
                  //       return const Prodacts_3();
                  //     },
                  //   ),
                  // );
                },
                child: cati_form(
                  child: const Center(
                      child: Text(
                    'catigory 7',
                    style: TextStyle(fontSize: 30),
                  )),
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const Prodacts_4();
                //     },
                //   ),
                // );
              },
              child: cati_form(
                child: const Center(
                    child: Text(
                  'catigory 7',
                  style: TextStyle(fontSize: 30),
                )),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const Prodacts_5();
                //     },
                //   ),
                // );
              },
              child: cati_form(
                child: const Center(
                    child: Text(
                  'catigory 7',
                  style: TextStyle(fontSize: 30),
                )),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const Prodacts_6();
                //     },
                //   ),
                // );
              },
              child: cati_form(
                child: const Center(
                    child: Text(
                  'catigory 7',
                  style: TextStyle(fontSize: 30),
                )),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const Prodacts_2();
                //     },
                //   ),
                // );
              },
              child: Container(
                width: 200,
                height: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 43, 116, 225),
                    Colors.white
                  ]),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 43, 116, 225),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Center(
                    child: Text(
                  'catigory 7',
                  style: TextStyle(fontSize: 30),
                )),
              ),
            ),
          ],
        ),
      ),
    ])));
  }
}
