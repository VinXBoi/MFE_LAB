import 'package:flutter/material.dart';
import 'W06/m06.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ItemProvider(),
    child: const MyApp(),
  ));
}

class ItemProvider extends ChangeNotifier {
  List<Kegiatan> items = [
    Kegiatan(judul: 'Judul 1', description: 'Desc 1'),
    Kegiatan(judul: 'Judul 2', description: 'Desc 2'),
    Kegiatan(judul: 'Judul 3', description: 'Desc 3'),
  ];

  void addItem(String judul, String description) {
    items.add(Kegiatan(judul: judul, description: description));
    notifyListeners();
  }
}

class Kegiatan {
  String judul, description;

  Kegiatan({required this.judul, required this.description});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const W06Page(),
    );
  }
}
