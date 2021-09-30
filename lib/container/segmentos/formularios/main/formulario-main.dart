import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/process/dataListas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormularioMain {
  String? dadosJSON;
  String? dadosTransps;

  /*FORMULARIO*/
  Widget mainFormulario(context) {
    return Form(
      child: Container(
        width: 300,
        margin: EdgeInsets.only(top: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: FormularioMain().pesquisarNomeTransportador(),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: ElevatedButton(
                          style: null,
                          onPressed: null,
                          child: Text("scan".toUpperCase()),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: ElevatedButton(
                          style: null,
                          child: Text("pesquisar".toUpperCase()),
                          onPressed: () async {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            /*CHAMA DADOS DE SESSAO*/
                            final prefs = await SharedPreferences.getInstance();
                            dadosJSON =
                                "{\"motoristaNome\": \"${prefs.getString("motorista")}\"}";
                            prefs.setString("swit", "buscar-transportador");
                            prefs.setString("search", dadosJSON!);
                            /*INICIA CONEXAO & DADOS*/
                            String dadosTransps =
                                await GeradorListas().gerarListas();
                            var jdata = jsonDecode(dadosTransps.toString());
                            if (int.parse(jdata["status"]) == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(jdata["msn"]),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                            if (int.parse(jdata["status"]) == 1) {
                              Navigator.of(context)
                                  .pushReplacementNamed("/listarAgregados");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(jdata["msn"]),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pesquisarNomeTransportador() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 3,
      decoration: InputDecoration(
        labelText: null,
        hintText: "Nome do Motorista".toUpperCase(),
        border: OutlineInputBorder(),
      ),
      onChanged: (text) async {
        final stores = await SharedPreferences.getInstance();
        stores.setString("motorista", text);
      },
    );
  }
}
