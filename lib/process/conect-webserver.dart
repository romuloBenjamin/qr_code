import 'package:http/http.dart' as http;

class ConectWebServer {
  var urlServer = "http://162.241.88.255/~wwsale/webServer/index.php";

  Future setConection(String data) async {
    final response = await http.post(
      Uri.parse(urlServer),
      body: {
        "AndroidAsks": data.toString(),
      },
    );

    /*ERRO 500*/
    if (response.statusCode == 500)
      return "{\"status\":\"0\", \"msn\":\"Desculpe, não foi possível conectar com o WebServer!\"}";
    /*OUTROS ERRO*/
    if (response.statusCode != 200)
      return "{\"status\":\"0\", \"msn\":\"Desculpe, não foi possível conectar com o WebServer!\"}";
    if (response.statusCode == 200) return response.body;
  }
}
