import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future GetWebServerData(
  String searchdata,
  String passkey,
  String controls,
  String switdata,
) async {
  final response = await http.post(
    Uri.parse("http://162.241.88.255/~wwsale/webServer/index.php"),
    body: {
      "AndroidAsks": jsonEncode(
        {
          "status": "1",
          "search": searchdata,
          "keys": passkey,
          "controls": controls,
          "swit": switdata,
        },
      ),
    },
  );

  var json;
  if (response.statusCode == 200) {
    if (response.body.isEmpty == true) {
      json = jsonEncode(
          "{\"status\":\"0\", \"msn\":\"Desculpe, não foi possível conectar com o WebServer!\"}");
    } else {
      json = jsonEncode(response.body);
    }
  } else {
    json = jsonEncode(
        "{\"status\":\"0\", \"msn\":\"Desculpe, não foi possível conectar com o WebServer!\"}");
  }
  return jsonDecode(json);
}
