import 'dart:core';
import 'package:firebasemiftah/src/screens/excell.dart';

import 'hasilpembelian.dart';
import 'result.dart';
import 'dart:math';
import 'home.dart';
import 'package:firebasemiftah/src/screens/hasilpembelian.dart';
import 'package:flutter/material.dart';
import 'result.dart';
import 'roundicon.dart';
import 'package:http/http.dart' as http;

import 'calculate.dart';
import 'editdataa.dart';
import 'dart:typed_data';
import 'hasilpembelian.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

import 'package:firebasemiftah/src/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'result.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'calculate.dart';
import 'dart:convert';
import 'dart:async';

import 'tambahdata.dart';

class detail extends StatefulWidget {
  final List list;

  Future<List> getdataa() async {
    final respone =
        await http.get(Uri.parse("http://192.168.12.1/getdata.php"));
    return json.decode(respone.body);
  }

  //int hargass =() ;

  //Itemlist( detail({required this.index, required this.list});{required this.list});
  int index;
  detail({required this.index, required this.list});

  @override
  _detailState createState() => _detailState();
}

// abstract class hargawoi extends StatefulWidget {
//   Future  main() async{ var settings = ConnectionSettings(
//       host: 'localhost',
//       port: 3306,
//       user: 'miftah',
//       password: '1301zz1301hh',
//       db: 'toko_miftah');
//       var conn = await MySqlConnection.connect(settings);
//   @override
//   _hargawoiState createState() => _hargawoiState();}

// }

// class _hargawoiState extends State<hargawoi> {
//   @override
//   Widget build(BuildContext context) {
//     return Text('');
//   }
// }
// HARGA BARANG BENTUK TEXT!!!    //  "Harga satuan : ${widget.list[widget.index]['price']}",
//         style: TextStyle(fontSize: 20),

class _detailState extends State<detail> {
  // late String namaBarang;
  //late String fetchdatas;
  // late String hargabarangg;
  int jumlah = 0;
  int harga = 2;
  //final String title;

  //var hargaya = {url: 'http://192.168.12.1/celana1.jpg'};

  late int index;
  //var hargafetch =fetchdata.int

  void deleteData() {
    var url = "http://192.168.12.1/deleteData.php";

    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("Apakah anda yakin ingin Keluar?"),
                content:
                    const Text("Ketika Log out anda diarahkan ke menu Log in"),
                actions: <Widget>[
                  TextButton(
                      child: const Text("Hapus"),
                      onPressed: () {
                        deleteData();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      }),
                  TextButton(child: const Text("batal"), onPressed: () {}),
                  // AlertDialog alertDialog = AlertDialog(
                  //   content: Text(
                  //       "apakah anda yakin untuk hapus? '${widget.list[widget.index]['item_name']}'"),
                  //   actions: <Widget>[
                  //     RaisedButton(
                  //         child: Text('delete'),
                  //         color: Colors.red,
                  //         onPressed: () {
                  //           deleteData();
                  //           Navigator.of(context).push(MaterialPageRoute(
                  //             builder: (BuildContext context) => getdataa(),
                  //           ));
                  //         }),
                  //     RaisedButton(
                  //         child: Text('cancel'), color: Colors.blue, onPressed: () {}),
                  //   ],
                  // );

                  // showDialog(context: context, child: alertDialog);
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['item_name']}"),
      ),
      body: Container(
        height: 700,
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                Text(
                  widget.list[widget.index]['item_name'],
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Code: ${widget.list[widget.index]['item_code']}",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Harga : ${widget.list[widget.index]['price']}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "stock: ${widget.list[widget.index]['stock']}",
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  RaisedButton(
                      child: Text("Edit"),
                      color: Colors.green,
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => EditData(
                                    list: widget.list,
                                    index: widget.index,
                                  )))),
                  RaisedButton(
                    child: Text("Delete"),
                    color: Colors.red,
                    onPressed: () => confirm(),
                  ),
                ]),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Harga : ${widget.list[widget.index]['price']}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      harga.toString(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      //int jumlah ke string
                      jumlah.toString(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text("Jumlah"),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RoundIconButton(
                      icon: Icons.add,
                      onPressed: () {
                        setState(() {
                          jumlah++;
                        });
                      },
                    ),
                    RoundIconButton(
                      icon: Icons.delete,
                      onPressed: () {
                        setState(() {
                          jumlah--;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      child: Text("Pesan"),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => hasilbeli(
                                      jumlah: jumlah,
                                    )));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
