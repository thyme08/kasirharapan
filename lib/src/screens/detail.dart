import 'dart:core';
import 'package:firebasemiftah/src/screens/excell.dart';
import 'googlesheet/kasirexcel.dart';
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

  int index;

  var hargasss;
  detail({required this.index, required this.list, required this.hargasss});

  @override
  _detailState createState() => _detailState(hargasss: hargasss);
}

class _detailState extends State<detail> {
  // late String namaBarang;
  //late String fetchdatas;
  // late String hargabarangg;
  _detailState({required this.hargasss});
  var hargasss;
  int jumlah = 0;

  // var hargass = "Harga : ${widgett.list[widget.index]['price']}";

  //final String title;

  //var hargaya = {url: 'http://192.168.12.1/celana1.jpg'};

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
                      "Harga : ${widget.list[widget.index]['price']}"
                          .toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          "Jumlah",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          //int jumlah ke string
                          jumlah.toString(),
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     Padding(padding: EdgeInsets.all(10)),
                    //     Text(
                    //       "harga",
                    //       style: TextStyle(fontSize: 20),
                    //     ),
                    //     Text(
                    //       //int jumlah ke string
                    //       hargasss.toString(),
                    //       style: TextStyle(
                    //         fontSize: 38,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ],
                    // )
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
                    // RoundIconButton(
                    //   icon: Icons.delete,
                    //   onPressed: () {
                    //     setState(() {
                    //       hargasss--;
                    //     });
                    //   },
                    // ),
                    // RoundIconButton(
                    //   icon: Icons.add,
                    //   onPressed: () {
                    //     setState(() {
                    //       hargasss++;
                    //     });
                    //   },
                    // ),
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
                                // builder: (context) => excellah(),

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
