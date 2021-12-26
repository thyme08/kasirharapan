import 'dart:typed_data';
import 'hasilpembelian.dart';
import 'detail.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'hasilpembelian.dart';

class MyApp extends StatelessWidget {
  int jumlah = 3;
  MyApp({
    required this.jumlah,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: excelkasir(title: 'Flutter Demo Home Page'),
    );
  }
}

class excelkasir extends StatefulWidget {
  excelkasir({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  int jumlah = 3;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<excelkasir> {
  late final int julah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            ElevatedButton(child: Text('Create Excel'), onPressed: createExcel),
      ),
    );
  }

  Future<void> createExcel() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByName('A2').setText("223");

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      // AnchorElement
      // (
      //   href:
      //       'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      // ..setAttribute('download', 'Output.xlsx')
      // ..click();
    } else {
      final String path = (await getApplicationDocumentsDirectory()).path;
      final String fileName =
          Platform.isAndroid ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      print('Output.xlsx');
      await file.writeAsBytes(bytes, flush: true);

      OpenFile.open(fileName);
    }
  }
}
