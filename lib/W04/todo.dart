import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {
  final int idx;
  final String judul, desc;

  const ToDo(
      {super.key, required this.idx, required this.judul, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 40,
        height: 40,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
        alignment: Alignment.center,
        child: Text(
          "$idx",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(judul), Text(desc)],
      ),
      const Expanded(
        child: Text(''),
      ),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          color: Colors.blue,
          child: const Text('Work'),
        ),
        const Text('Ini Date'),
        const Text('Ini Date'),
      ])
    ]);
  }
}
