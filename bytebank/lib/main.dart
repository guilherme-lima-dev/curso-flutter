import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());


class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700]
      ),
      home: Dashboard(),
    );
  }
}