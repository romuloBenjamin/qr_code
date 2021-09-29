import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'SetHttpPostData.dart';

class GeradorListas {
  late String rawMap;
  var json = {};
  var iMap;

  gerarListas(String listas) async {
    final store = await SharedPreferences.getInstance();
    String? search = store.getString("search");
    String? swit = store.getString("swit");
    String? module = store.getString("module");
    String? keys = store.getString("keys");

    /*CONECT TO WEBSERVER*/
    if (swit == listas) {
      rawMap = await GetWebServerData(
        search!,
        keys!,
        module!,
        swit!,
      );
    }
    /*CONECT TO WEBSERVER*/
    if (swit != listas) {
      rawMap = await GetWebServerData(
        search!,
        keys!,
        module!,
        listas,
      );
    }
    iMap = jsonDecode(rawMap);
    return jsonEncode(iMap);
  }

  gerarEmptyList() {
    var listaEmpty = '{"status": "0", "data": [], "msn": "Gerando dados..."}';
    return listaEmpty;
  }

  /*GERAR LISTAGEMS*/
  Future<String> gerarFutureList(String searchData) async {
    var getHash = await GeradorListas().gerarListas(searchData.toString());
    return getHash;
  }
}
