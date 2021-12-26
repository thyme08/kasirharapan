import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:firebasemiftah/src/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}
