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

    print(response.body);
    return "{testando}";
  }
}
