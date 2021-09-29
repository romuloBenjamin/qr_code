import 'package:flutter/material.dart';
import 'package:qr_code/pages/login_page.dart';

class HeaderAPPS extends LoginPage {
  const HeaderAPPS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Flexible(
            child: Image(
              image: AssetImage('image/sales_logo_round.png'),
              width: 80,
              height: 80,
            ),
          ),
          Flexible(
            child: ListTile(
              title: Text("QRCode"),
              subtitle: Text("Controle de Entradas e Saidas"),
            ),
          )
        ],
      ),
    );
  }
}
