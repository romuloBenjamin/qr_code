import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dataListas.dart';

class ValidarFormularios {
  /*VALIDAR FORMULARIO*/
  validarFormulario(String usuario, String senha, String gate) async {
    var jSend =
        "{\"usuario\":\"$usuario\",\"senha\":\"$senha\",\"gate\":\"$gate\"}";
    var jDados = jsonDecode(jSend.toString());
    /*USUARIO VAZIO*/
    if (jDados["usuario"].isEmpty)
      return ValidarFormularios().validarFormulario_errorMessage("usuario");
    /*SENHA VAZIA*/
    if (jDados["senha"].isEmpty)
      return ValidarFormularios().validarFormulario_errorMessage("senha");
    return await ValidarFormularios()
        .validarFutureLogin(jsonEncode(jDados), "logar-webserver");
  }

  /*EXECUTAR LOGIN*/
  validarFutureLogin(String dadosLogin, String swit) async {
    var stores = await SharedPreferences.getInstance();
    stores.setString("search", dadosLogin);
    stores.setString("swit", swit);
    /*SET RETURN*/
    return GeradorListas().gerarFutureList();
  }

  /*ERROR MESSAGE*/
  validarFormulario_errorMessage(String swit) {
    if (swit == "usuario")
      return "{\"status\":\"0\", \"msn\":\"Desculpe, não foi possivel identificar o Usuário informado!\"}";
    if (swit == "senha")
      return "{\"status\":\"0\", \"msn\":\"Desculpe, não foi possivel identificar a Senha informada!\"}";
  }
}
