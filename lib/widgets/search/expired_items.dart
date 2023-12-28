import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import '../../models/medicine.dart';
import '../../providers/auth_data_provider.dart';
import '../../services/refresh_expiration_service.dart';
import '../medicine_item.dart';

class ExpiredItems extends ConsumerStatefulWidget {
  const ExpiredItems({Key? key});

  @override
  ConsumerState<ExpiredItems> createState() => _ExpiredItemsState();
}

class _ExpiredItemsState extends ConsumerState<ExpiredItems> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Set up a timer to periodically refresh the data
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        // Check if the widget is still mounted before triggering a rebuild
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokenReader = ref.read(tokenProvider);
    final expirationWatcher = ref.watch(expirationProvider);

    return Expanded(
      flex: 2,
      child: FutureBuilder<List<MedicineModel>>(
        future: expirationWatcher.allExpiration(tokenReader.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MedicineModel> medicines = snapshot.data!;
            return Container(
              child: GridView.builder(
                itemCount: medicines.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      double maxWidth = 70.0;
                      double actualWidth =
                      constraints.maxWidth > maxWidth ? maxWidth : constraints.maxWidth;

                      return Container(
                        constraints: BoxConstraints(maxWidth: actualWidth),
                        child: MedicineItem(
                          medicine: medicines[index],
                          onSelectedMedicine: (int id) {
                            //_selectCategory(categories[index], id, ref);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}