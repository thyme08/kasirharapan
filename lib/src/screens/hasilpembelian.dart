import 'dart:convert';
import 'dart:ui';

import 'package:firebasemiftah/src/screens/exceljumlah.dart';
import 'package:firebasemiftah/src/screens/googlesheet/kasirexcel.dart';
import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:http/http.dart' as http;
import 'excell.dart';
import 'home.dart';

class hasilbeli extends StatelessWidget {
  //declar final int jadi jumlah

  final int jumlah;
  Future<List> getdataa() async {
    final respone =
        await http.get(Uri.parse("http://139.0.189.48/getdata.php"));
    return json.decode(respone.body);
  }

//hasil beli membutuhkan jumlah
  const hasilbeli({
    required this.jumlah,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hasil beli")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'TOTAL',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'IDR ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '.000',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //jumlah di deklar dan dijadikan string

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Jumlah Barang:",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      jumlah.toString(),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                RaisedButton(
                    child: Text('simpan excel'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => excellah(
                                    dorr: jumlah,
                                  )
                              // builder: (context) =>
                              //     excelkasirr(Jumlah: jumlah)
                              ));
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
