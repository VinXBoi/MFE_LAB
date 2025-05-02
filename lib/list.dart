// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/m03.dart';
// import 'package:provider/provider.dart';
// import 'main.dart';

// class ListPage extends StatefulWidget {
//   const ListPage({super.key});

//   @override
//   State<ListPage> createState() => _ListPageState();
// }

// class _ListPageState extends State<ListPage> {
//   @override
//   Widget build(BuildContext context) {
//     final itemProvider = context.watch<ItemProvider>();
//     final items = itemProvider.items;
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: (){
//         Navigator.pushReplacement(context, 
//           MaterialPageRoute(builder: (context) => M03())
//         );
//       }, child: Icon(Icons.add),),
//       appBar: AppBar(
//         title: const Text('List Item'),
//         centerTitle: true,
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.purple,
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           var item = items[index];
//           String dateNow = DateTime.now().toString();
//           return ListTile(
//             contentPadding: EdgeInsets.all(20.0),
//             leading: CircleAvatar(
//               backgroundColor: Colors.purple,  // Circle color
//               child: Text(
//                 (index + 1).toString(),  // Circle will show index + 1
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             title: Text(item['judul'] ?? 'No Title'),
//             subtitle: Text(item['description'] ?? 'No Description'),
//             trailing: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(dateNow),  // First date
//                 Text(dateNow),  // Second date
//                 Text(dateNow),  // Third date
//               ],
//             ),
//           );
//         }),
//     );
//   }
// }