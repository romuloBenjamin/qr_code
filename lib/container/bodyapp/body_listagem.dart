import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code/container/segmentos/listano_data.dart';
import 'package:qr_code/container/segmentos/listaview_data.dart';
import 'package:qr_code/process/dataListas.dart';

class ListagemTransp extends StatefulWidget {
  const ListagemTransp({Key? key}) : super(key: key);
  State<ListagemTransp> createState() => _BodyListagemTransp();
}

class _BodyListagemTransp extends State<ListagemTransp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: Colors.black,
          ),
        ),
      ),
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
              child: Text("Transportadores:"),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    style: BorderStyle.solid,
                    width: 1.0,
                    color: Color(0xFF898989),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: FutureBuilder(
              future: GeradorListas().gerarFutureList("search-intranet"),
              initialData: GeradorListas().gerarEmptyList(),
              builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
                var jdata = jsonDecode(snapshot.data.toString());
                if (jdata["status"] == "0")
                  return NoListasData().listasNodata(jdata["msn"].toString());
                else
                  return ListaViewData()
                      .listarListView(jsonEncode(jdata["data"]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
