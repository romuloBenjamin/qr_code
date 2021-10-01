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
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(220, 220, 220, 1),
          ),
          color: Color.fromRGBO(240, 240, 240, 1),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: HeaderAPPS(),
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.loose,
              child: ListagemTransp(),
            ),
          ],
        ),
      ),
    );
  }
}
