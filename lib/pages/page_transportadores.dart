import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_code/container/headers/header_box.dart';

class Transportadores extends StatefulWidget {
  const Transportadores({Key? key}) : super(key: key);

  @override
  _MainTransportadores createState() => _MainTransportadores();
}

class _MainTransportadores extends State<Transportadores> {
  final prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/mainpage");
          },
        ),
        centerTitle: true,
        title: const Text("Transportador"),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: const <Widget>[
            HeaderAPPS(),
          ],
        ),
      ),
    );
  }
}
