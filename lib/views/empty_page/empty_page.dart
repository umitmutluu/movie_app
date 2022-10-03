import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HATA"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("Bir hata oluştu"),
        ),
      ),
    );
  }
}
