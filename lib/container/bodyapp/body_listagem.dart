import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code/container/segmentos/listagem/gerarListView.dart';

class ListagemTransp extends StatefulWidget {
  const ListagemTransp({Key? key}) : super(key: key);
  State<ListagemTransp> createState() => _BodyListagemTransp();
}

class _BodyListagemTransp extends State<ListagemTransp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color.fromRGBO(0, 0, 0, 1)),
                  bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 1)),
                ),
                color: Color.fromRGBO(240, 240, 240, 1),
              ),
              width: double.infinity,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                "Lista de Transportadores".toUpperCase(),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 5),
              child: GerarListView().buildListagem(context),
            ),
          ),
        ],
      ),
    );
  }
}
