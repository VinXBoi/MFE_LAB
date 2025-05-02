import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'm03.dart'; // Navigate target
import 'package:flutter_application_1/main.dart'; // Contains ItemProvider and Kegiatan class

class W06Page extends StatefulWidget {
  const W06Page({super.key});

  @override
  State<W06Page> createState() => _W06PageState();
}

class _W06PageState extends State<W06Page> {
  bool isActive = false;
  Kegiatan? valueDropDown;
  String? nama;
  String? keterangan;
  String? kategori;

  @override
  Widget build(BuildContext context) {
    final itemProvider = context.watch<ItemProvider>();
    List<Kegiatan> itemsData = itemProvider.items;

    // Prevent null errors if item list is empty
    if (itemsData.isNotEmpty && valueDropDown == null) {
      valueDropDown = itemsData[0];
      nama = valueDropDown?.judul;
      keterangan = valueDropDown?.description;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const M03()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Praktek M06"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SwitchListTile(
            secondary: const Text("Aktifkan Dropdown", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
            value: isActive,
            onChanged: (newValue) {
              setState(() {
                isActive = newValue;
              });
            },
          ),

          // Dropdown
          DropdownButton<Kegiatan>(
            value: valueDropDown,
            hint: const Text("Choose One"),
            items: itemsData.map((data) {
              return DropdownMenuItem<Kegiatan>(
                value: data,
                child: Text(data.judul),
              );
            }).toList(),
            onChanged: isActive
                ? (Kegiatan? newValue) {
                    setState(() {
                      valueDropDown = newValue;
                      nama = newValue?.judul;
                      keterangan = newValue?.description;
                    });
                  }
                : null,
          ),

          // Display Info
          isActive && nama != null
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("NAMA : "),
                        Text(nama ?? ""),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Keterangan : "),
                        Text(keterangan ?? ""),
                      ],
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
