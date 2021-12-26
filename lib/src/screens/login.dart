import 'package:firebasemiftah/src/screens/home.dart';
import 'package:firebasemiftah/src/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  bool _passwordsembunyi = true;
  void _penglihatanpassword() {
    setState(() {
      _passwordsembunyi = !_passwordsembunyi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-1.png'))),
                          )),
                      Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-2.png'))),
                          )),
                      Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/clock.png'))),
                          )),
                      Positioned(
                          child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                  child: Text("kasir Harapan",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold)))))
                    ],
                  )),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email or Phone number",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _email = value.trim();
                                });
                              },
                            )),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _penglihatanpassword();
                                  },
                                  child: Icon(
                                      _passwordsembunyi
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: _passwordsembunyi
                                          ? Colors.grey
                                          : Colors.blue),
                                ),
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            obscureText: _passwordsembunyi,
                            onChanged: (value) {
                              setState(() {
                                _password = value.trim();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ])),
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                        onPressed: () {
                          auth
                              .signInWithEmailAndPassword(
                                  email: _email, password: _password)
                              .then((_) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          });
                        },
                      ))
                ]),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => registerr()));
                },
                child: Text("Regiser"),
              )
            ],
          )),
        ));
  }
}
