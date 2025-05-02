import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String nama, nim;
  const DetailPage({super.key, required this.nama, required this.nim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Page'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [Text(nama), Text(nim)],
                ),
                const Icon(Icons.person)
              ],
            )));
  }
}
