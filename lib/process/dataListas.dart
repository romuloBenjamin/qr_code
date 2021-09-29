import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'conect-webserver.dart';

class GeradorListas {
  String sendData = "";
  var json = {};

  gerarListas() async {
    final stores = await SharedPreferences.getInstance();
    String? search = stores.getString("search");
    String? swit = stores.getString("swit");

    /*SET OBJECTS -> Keys*/
    json["wsKey"] = "NGqHZa8H39Kr8KHXbxpHQQpQjTxGLN";
    /*DADOS PARA RESGATE NO WS*/
    if (search!.isNotEmpty) {
      json["data"] = search;
    } else {
      json["search"] = {};
    }
    /*CHAVE DE PESQUISA MODULO*/
    if (swit!.isNotEmpty) {
      json["swit"] = swit;
    } else {
      json["swit"] = "sendToDebug";
    }
    sendData = jsonEncode(json);
    return GeradorListas().conectWS(sendData);
  }

  gerarEmptyList() {
    var listaEmpty = '{"status": "0", "data": [], "msn": "Gerando dados..."}';
    return listaEmpty;
  }

  /*GERAR LISTAGEMS*/
  Future<String> gerarFutureList() async {
    var getHash = await GeradorListas().gerarListas();
    return getHash;
  }

  /*CONECT TO WS*/
  conectWS(String data) async {
    return ConectWebServer().setConection(data);
  }
}
