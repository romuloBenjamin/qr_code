import 'package:flutter/material.dart';
import 'package:qr_code/container/bodyapp/body_main.dart';
import 'package:qr_code/container/headers/header_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PRINCIPAL",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: const <Widget>[
            HeaderAPPS(),
            BodyMains(),
          ],
        ),
      ),
    );
  }
}
