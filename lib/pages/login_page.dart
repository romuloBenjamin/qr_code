import 'package:flutter/material.dart';
import 'package:qr_code/container/bodyapp/body_login.dart';
import 'package:qr_code/container/headers/header_box.dart';

//MAIN PAGE STRUTURA
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("QRCODE"),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: const <Widget>[
            HeaderAPPS(),
            Body_login(),
          ],
        ),
      ),
    );
  }
}
