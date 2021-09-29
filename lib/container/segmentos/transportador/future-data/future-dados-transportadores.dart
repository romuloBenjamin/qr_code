import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/process/dataListas.dart';
import 'package:qr_code/container/segmentos/transportador/dados-transportador/widTransportador.dart';
//import 'package:qr_code/container/segmentos/transportador/dados-terceirizacao/widTransportador.dart';

class FutureDataTransportadores {
  /*FUTURE DATA*/
  getFutureDataTransportadores(String busca) {
    return FutureBuilder(
      future: GeradorListas().gerarFutureList(),
      initialData: GeradorListas().gerarEmptyList(),
      builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
        var jdata = jsonDecode(snapshot.data.toString());
        /*NÂO LOCALIZADO DADOS DO AGREGADO*/
        if (int.tryParse(jdata["status"]) == 0)
          return FutureDataTransportadores().dadosAgregadosErro_nLocalizado();
        /*LOCALIZADO DADOS DO AGREGADO*/
        if (int.tryParse(jdata["status"]) == 1) {
          if (busca == "dados-transportador")
            return DadosTransportador()
                .dados_do_transportador(jdata["data"][0]);
          if (busca == "dados-terceirizacao")
            return DadosTransportador()
                .dados_do_transportador(jdata["data"][0]);
        }
        /*ERRO AO GERAR DADOS*/
        return FutureDataTransportadores().dadosAgregadosErro();
      },
    );
  }

  /*ERRO AO GERAR DADOS*/
  Widget dadosAgregadosErro() {
    return Text("Desculpe houve um erro ao Gerar a listagem!");
  }

  /*NÃO LOCALIZADO DADOS DO AGREGADO*/
  Widget dadosAgregadosErro_nLocalizado() {
    return Text("Não localizado Transportador informado!");
  }
}
