// import 'package:flutter/material.dart';
// import 'dart:typed_data';
// import 'hasilpembelian.dart';
// import 'detail.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';
// import 'dart:io';
// import 'package:open_file/open_file.dart';
// import 'package:universal_html/html.dart' show AnchorElement;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'dart:convert';
// import 'package:path_provider/path_provider.dart';
// import 'hasilpembelian.dart';

// class excelkasirr extends StatelessWidget {
//   var Jumlah;

//   excelkasirr({required this.Jumlah});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child:
//             ElevatedButton(child: Text('Create Excel'), onPressed: createExcel),
//       ),
//     );
//   }

//   Future<void> createExcel() async {
//     final Workbook workbook = Workbook();
//     final Worksheet sheet = workbook.worksheets[0];

//     sheet.getRangeByName('A1').setText(Jumlah.toString());
//     sheet.getRangeByName('A1').setText(Jumlah.toString());
//     // sheet.getRangeByName('A2').setText(Jumlah.toString());
//     // sheet.getRangeByName('A3').setText(Jumlah.toString());

//     // final Range range = sheet.getRangeByName('A1');
//     // range.setText(Jumlah.toString());

//     const bool isProtectWindow = true;
//     const bool isProtectContent = true;
//     workbook.protect(isProtectWindow, isProtectContent, 'password');

//     final List<int> bytes = workbook.saveAsStream();
//     File('Output.xlsx').writeAsBytes(bytes);
//     workbook.dispose();

//     if (kIsWeb) {
//       // AnchorElement
//       // (
//       //   href:
//       //       'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
//       // ..setAttribute('download', 'Output.xlsx')
//       // ..click();
//     } else {
//       final String path = (await getApplicationDocumentsDirectory()).path;
//       final String fileName =
//           Platform.isAndroid ? '$path\\Output.xlsx' : '$path/Output.xlsx';
//       final File file = File(fileName);
//       print('Output.xlsx');
//       await file.writeAsBytes(bytes, flush: true);

//       OpenFile.open(fileName);
//     }
//   }
// }


//   _excelkasirrState createState() => _excelkasirrState();
// }

// class _excelkasirrState extends State<excelkasirr> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(
//         child:
//             ElevatedButton(child: Text('Create Excel'), onPressed: createExcel),
//       ),
      
//     );
    
//   }
//   Future<void>createExcel() async {  final Workbook workbook = Workbook();
//     final Worksheet sheet = workbook.worksheets[0];

//     final Range range = sheet.getRangeByName('A1');
//     range.setText(jumlah.toString());

//     final bool isProtectWindow = true;
//     final bool isProtectContent = true;
//     workbook.protect(isProtectWindow, isProtectContent, 'password');

//     final List<int> bytes = workbook.saveAsStream();
//     File('Output.xlsx').writeAsBytes(bytes);
//     workbook.dispose();

//     if (kIsWeb) {
//       // AnchorElement
//       // (
//       //   href:
//       //       'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
//       // ..setAttribute('download', 'Output.xlsx')
//       // ..click();
//     } else {
//       final String path = (await getApplicationDocumentsDirectory()).path;
//       final String fileName =
//           Platform.isAndroid ? '$path\\Output.xlsx' : '$path/Output.xlsx';
//       final File file = File(fileName);
//       print('Output.xlsx');
//       await file.writeAsBytes(bytes, flush: true);

//       OpenFile.open(fileName);
//     }}
// }