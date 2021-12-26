import 'dart:math';

import 'package:firebasemiftah/kasir/main2.dart';
import 'package:firebasemiftah/src/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'result.dart';
import 'dart:convert';
import 'dart:async';
import 'reusabe_cardd.dart';

import 'tambahdata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        await http.get(Uri.parse("http://192.168.12.1/getdata.php"));
    return json.decode(respone.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainHome()));
              },
              icon: Icon(Icons.dangerous)),
          title: Text("kasir harapan"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => tambahdataa())),
            child: Icon(Icons.add)),
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
                child: TextButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              detail(index: i, list: list),
                        )),
                    // child: Image.network(list[i]["gambar"])
                    child: Text(list[i]["item_name"])
                    //  child: Image(image: AssetImage("assets/images/light-1.png")),
                    //   child: Image(image: (list[i]["gambar"])),
                    //  child: list == null   ? Text("no image") : Image.file(list[i]["gambar"]),
                    ),
                //child: Text(list[i]["item_name"]),

                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
              );
            }),
      ),
    );
  }
}
