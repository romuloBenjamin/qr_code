import 'dart:convert';

class ValidarFormularios {
  validarFormulario(String usuario, String senha, String portao) {
    var json = jsonDecode(
        '{"status": "0", "user": "", "senha": "", "gate": "", "message": ""}');
    var responser = "";
    if (usuario.isNotEmpty) {
      json["user"] = usuario;
    }
    if (senha.isNotEmpty) {
      json["senha"] = senha;
    }
    if (usuario.isNotEmpty && senha.isNotEmpty) {
      json["status"] = "1";
    } else {
      json["message"] = "Desculpe, usuário e senha invalidos!";
    }
    json["gate"] = portao;
    responser = jsonEncode(json);
    return responser;
  }
}
