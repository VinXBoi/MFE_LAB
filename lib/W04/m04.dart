import 'package:flutter/material.dart';
import 'package:flutter_application_1/W03/m03.dart';
import 'package:flutter_application_1/W04/todo.dart';

class M04Page extends StatefulWidget {
  const M04Page({super.key});

  @override
  State<M04Page> createState() => _M04PageState();
}

class _M04PageState extends State<M04Page> {
  final List<Widget> arr = [
    const ToDo(
        idx: 1,
        judul: 'Create Video Tutorial',
        desc: 'Tutorial Video Untuk Pembelajaran Daring Pertemuan 02'),
    const ToDo(
        idx: 2, judul: 'Update Modul M02', desc: 'Perlu Tambah Topik Flutter'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: const Text("Todos"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: arr.length,
          itemBuilder: (context, index) {
            return arr[index];
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const M03()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
