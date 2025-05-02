import 'package:flutter/material.dart';
import 'package:flutter_application_1/list.dart';
import 'package:flutter_application_1/m06.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class M03 extends StatefulWidget {
  const M03({super.key});

  @override
  State<M03> createState() => _M03State();
}

class _M03State extends State<M03> {
  String? selectedValue;
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.list),
              SizedBox(
                width: 10,
              ),
              Text('Kegiatan'),
              SizedBox(width: 40),
              Expanded(
                  child: TextField(
                    controller: _judulController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Judul Kegiatan",
                ),
              )),
              SizedBox(
                width: 20,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.list_alt_sharp),
              SizedBox(
                width: 10,
              ),
              Text('Keterangan')
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(55, 20, 20, 20),
            child: Expanded(
                child: TextField(
                  controller: _descController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: "Tambah Keterangan",
              ),
              minLines: 2,
              maxLines: 2,
            )),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.calendar_month),
                  Text('Tanggal Mulai'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  Text('Tanggal Selesai'),
                  SizedBox(
                    width: 100,
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: DateTime.now().toString()),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: DateTime.now().toString()),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(children: [
            Expanded(child: Text('')),
            DropdownMenu(
              initialSelection: selectedValue,
              label: const Text('Pilih Value'),
              onSelected: (String? value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 'Jakarta', label: 'Jakarta'),
                DropdownMenuEntry(value: 'Medan', label: 'Medan'),
                DropdownMenuEntry(value: 'Siantar', label: 'Siantar'),
              ],),
              const SizedBox(
                    width: 20,
                  )
          ],),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(''),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.grey))),
                  child: const Text('Batal')),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    if(_judulController.text.isEmpty || _descController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('All fields must be filled!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);  // Close the dialog
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Provider.of<ItemProvider>(context, listen: false).addItem(_judulController.text, _descController.text);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => W06Page()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.grey))),
                  child: const Text('Simpan')),
              const Expanded(
                child: Text(''),
              ),
            ],
          )
        ],
      ),
    );
  }
}
