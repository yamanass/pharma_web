import 'package:flutter/material.dart';

class textfield_search extends StatelessWidget {
  const textfield_search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1430,
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 236, 238, 238),
            prefixIcon: const Icon(Icons.search),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(70.0)),
            hintText: 'search...',
            label: const Text('Search')),
      ),
    );
  }
}
