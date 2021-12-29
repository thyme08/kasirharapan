import 'package:flutter/material.dart';

import 'controller.dart';
import 'feedback.dart';

class hasilpembelian extends StatelessWidget {
  var hasimpembeliann;

  hasilpembelian({required this.hasimpembeliann});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class excellah extends StatelessWidget {
  var dorr;

  excellah({required this.dorr});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        daristl: dorr,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  var daristl;

  MyHomePage({required this.daristl});
  @override
  _hasilpembelian createState() => _hasilpembelian(duar: daristl);
}

class _hasilpembelian extends State<MyHomePage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController npmController = TextEditingController();
  TextEditingController nilai1NoController = TextEditingController();
  TextEditingController nilai2Controller = TextEditingController();

  var duar;
  var noll = null;

  _hasilpembelian({required this.duar});

//  get totalproduk => null;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      FeedbackForm feedbackForm = FeedbackForm(
        noll.toString(),
        //nameController.text,

        duar.toString(),
        //npmController.text,
        noll.toString(),
        //        nilai2Controller.text
        noll.toString(),
      );

      FormController formController = FormController((String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          //
          _showSnackbar("Feedback Submitted");
        } else {
          _showSnackbar("Error Occurred!");
        }
      });

      _showSnackbar("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheet

      formController.submitForm(feedbackForm);
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tekan tombol Simpan jika sudah sesuai"),
      ),
      key: _scaffoldKey,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // TextFormField(
                    //   controller: nameController,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Masukkan NPM mahasiswa";
                    //     }
                    //     return null;
                    //   },
                    //   decoration: InputDecoration(labelText: "namabarang"),
                    // ),
                    Column(
                      children: [
                        Text(
                          noll.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          duar.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          noll.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          noll.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    // TextFormField(
                    //   controller: npmController,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Masukkan NPM mahasiswa";
                    //     }
                    //     return null;
                    //   },
                    //   decoration: InputDecoration(labelText: "NPM"),
                    // ),
                    // TextFormField(
                    //   controller: nilai2Controller,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Masukkan Nilai kedua";
                    //     }
                    //     return null;
                    //   },
                    //   decoration: InputDecoration(labelText: "Nilai kedua"),
                    // ),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: _submitForm,
                      child: Text('Simpan'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
