import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class tambahdataa extends StatefulWidget {
  @override
  _tambahdataaState createState() => _tambahdataaState();
}

class _tambahdataaState extends State<tambahdataa> {
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();
  void addData() {
    var url = "http://192.168.12.1/adddata.php";
    http.post(url, body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tambahdata"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              TextField(
                controller: controllerCode,
                decoration: InputDecoration(
                    hintText: "item code", labelText: "Item code"),
              ),
              TextField(
                controller: controllerName,
                decoration: InputDecoration(
                    hintText: "item Name", labelText: "Item Name"),
              ),
              TextField(
                controller: controllerPrice,
                decoration:
                    InputDecoration(hintText: "Price", labelText: "Item Price"),
              ),
              TextField(
                controller: controllerStock,
                decoration:
                    InputDecoration(hintText: "Stock", labelText: "Item Stock"),
              ),
              Padding(padding: const EdgeInsets.all(10)),
              RaisedButton(
                onPressed: () {
                  addData();
                  Navigator.pop(context);
                },
                child: Text("Add data"),
                color: Colors.blueAccent,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
