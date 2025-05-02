import 'package:flutter/material.dart';
import 'package:flutter_application_1/W02/detail.dart';

class Mahasiswa {
  String nim, nama;
  Mahasiswa({this.nama = '', this.nim = ''});
}

class M02Page extends StatefulWidget {
  const M02Page({super.key});

  @override
  State<M02Page> createState() => _M02PageState();
}

class _M02PageState extends State<M02Page> {
  List<Mahasiswa> dataMahasiswa = List.empty();

  Future getMhs() {
    List<Mahasiswa> data = [
      Mahasiswa(nama: '', nim: ''),
      Mahasiswa(nama: '', nim: ''),
      Mahasiswa(nama: '', nim: ''),
      Mahasiswa(nama: '', nim: ''),
      Mahasiswa(nama: '', nim: ''),
      Mahasiswa(nama: '', nim: ''),
      Mahasiswa(nama: '', nim: ''),
      Mahasiswa(nama: '', nim: ''),
      Mahasiswa(nama: '', nim: ''),
    ];
    List<String> namaMhs = [
      'Asep',
      'Budi',
      'Caca',
      'Daniel',
      'Erere',
      'Fera',
      'Gatot',
      'Hanzo',
      'Ixia'
    ];
    for (var i = 0; i < 9; i++) {
      data[i].nama = namaMhs[i];
      data[i].nim = "23111999${i + 1}";
    }
    dataMahasiswa = data;
    return Future.value(data);
  }

  @override
  void initState() {
    super.initState();
    getMhs().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('W02'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 6),
        itemCount: dataMahasiswa.length,
        itemBuilder: (context, index) {
          return TextButton(
              style: const ButtonStyle(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            nama: dataMahasiswa[index].nama,
                            nim: dataMahasiswa[index].nim,
                          )),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dataMahasiswa[index].nim),
                  const SizedBox(width: 10),
                  Text(dataMahasiswa[index].nama)
                ],
              ));
        },
      ),
    );
  }
}
