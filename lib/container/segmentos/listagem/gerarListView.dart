import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GerarListView {
  buildListagem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(240, 240, 240, 1),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(top: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              width: double.infinity,
              child: FutureBuilder(
                initialData: GerarListView().gerarNoLista(),
                future: GerarListView().gerarDataLista(),
                builder:
                    (BuildContext context, AsyncSnapshot<Object?> snapshot) {
                  final jdata = jsonDecode(jsonEncode(snapshot.data));
                  if (int.parse(jdata["status"]) == 0)
                    return GerarListView().buildListagemNoData();
                  return GerarListView().buildListagemData(jdata);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*CREATE INIDATA*/
  dynamic gerarNoLista() {
    final stores =
        jsonDecode("{\"status\":\"0\", \"msn\":\"gerando dados...\"}");
    return stores;
  }

  /*GERAR FUTURE DATA*/
  Future<dynamic> gerarDataLista() async {
    final stores = await SharedPreferences.getInstance();
    final loudVars = jsonDecode(stores.getString("dadosINI").toString());
    return loudVars;
  }

  /*CREATE LIST NO DATA*/
  Widget buildListagemNoData() {
    final placeImage =
        "http://162.241.88.255/~wwsale/intranet/2.0/cnt-files/2.1/images/funcionarios/";

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: ListTile(
              leading: Image.network(
                placeImage + "no-image/no-image-default.png",
              ),
              title: Text("Transportador não localizado!".toUpperCase()),
            ),
          )
        ],
      ),
    );
  }

  /*CREATE LIST DATA -> BASE*/
  Widget buildListagemData(jdata) {
    List<dynamic> listar = jdata["dados"];
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  GerarListView().listCards(listar[index]),
              separatorBuilder: (context, index) => Divider(),
              itemCount: listar.length,
            ),
          )
        ],
      ),
    );
  }

  /*CREATE LIST DATA -> CARDS*/
  Widget listCards(dynamic listar) {
    final placeImage =
        "http://162.241.88.255/~wwsale/intranet/2.0/cnt-files/2.1/images/funcionarios/";

    return ListTile(
      leading: Image.network(
        placeImage + "agregados/${listar["foto"]}",
        errorBuilder: (context, error, stackTrace) {
          return Image.network(placeImage + "no-image/no-image-default.png");
        },
      ),
      title: Text(listar["apelido"].toString().toUpperCase()),
    );
  }
}
