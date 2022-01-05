import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kasir Harapan',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  Future<List> getdataa() async {
    final respone =
        await http.get(Uri.parse("http://139.0.188.142/getdata.php"));
    return json.decode(respone.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("kasir harapan"),
        ),
        body: FutureBuilder<List>(
            future: getdataa(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? Itemlist(
                      list: snapshot.data ?? [],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }));
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kindacode.com'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 childAspectRatio: 3 / 2,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20),
//             itemBuilder: (BuildContext ctx, index) {
//               return Container(
//                 alignment: Alignment.center,
//                 child: Text(list),
//                 decoration: BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.circular(15)),
//               );
//             }),
//       ),
//     );
//   }
// }

class Itemlist extends StatelessWidget {
  final List list;
  Itemlist({required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: list == null ? 0 : list.length,
              itemBuilder: (context, i) {
                return Container(
                  alignment: Alignment.center,
                  //   child: Image(image: (list[i]["gambar"])),
                  //   child: Image.memory(list[i]["gambar"]),
                  child: Text(list[i]["item_name"]),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                );
              })),
    );
  }
}
