import 'package:flutter/material.dart';
import 'package:qr_code/container/bodyapp/body_listagem.dart';
import 'package:qr_code/container/headers/header_box.dart';

class ListarAgregados extends StatefulWidget {
  const ListarAgregados({Key? key}) : super(key: key);

  @override
  _ListarAgregadosPage createState() => _ListarAgregadosPage();
}

class _ListarAgregadosPage extends State<ListarAgregados> {
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
        title: Text("LISTAR TRANSPORTADORES"),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: const <Widget>[
            HeaderAPPS(),
            ListagemTransp(),
          ],
        ),
      ),
    );
  }
}
