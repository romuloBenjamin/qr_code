import 'package:flutter/material.dart';
import 'main_page.dart';
import 'login_page.dart';
import 'listar_agregados.dart';
import 'page_transportadores.dart';

//MAIN WID PART
class QRCode extends StatelessWidget {
  const QRCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const LoginPage(),
        "/mainpage": (context) => const MainPage(),
        "/listarAgregados": (context) => const ListarAgregados(),
        "/transportadores": (context) => const Transportadores(),
      },
    );
  }
}
