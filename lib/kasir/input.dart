import 'package:flutter/material.dart';
import 'result.dart';
import 'round_icon_button.dart';
import 'reusable_card.dart';
import 'calculate.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late String namaBarang;
  int jumlah = 4;
  int harga = 10;
  @override
  build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var FontAwesomeIcons;
    return Container(
      margin: EdgeInsets.only(top: 90),
      child: Column(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (text) {
                namaBarang = text;
              },
              decoration: InputDecoration(
                labelText: 'Nama Barang',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Jumlah',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            jumlah.toString(),
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons,
                                onPressed: () {
                                  setState(() {
                                    jumlah--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons,
                                onPressed: () {
                                  setState(() {
                                    jumlah++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Harga Satuan',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'IDR',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                harga.toString(),
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'K',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons,
                                onPressed: () {
                                  setState(() {
                                    harga--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons,
                                onPressed: () {
                                  setState(() {
                                    harga++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black38,
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              height: 80,
              color: Colors.amber,
              width: double.infinity,
            ),
            onTap: () {
              Calculate calc = Calculate(harga: harga, jumlah: jumlah);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    namaBarang: namaBarang,
                    total: calc.calculateTotal(),
                    harga: harga,
                    jumlah: jumlah,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
