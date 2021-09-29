import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormularioLogin {
  /*GET INPUT -> USUARIO*/
  inputUsuario() {
    String usuario = "";
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: "Usuário".toUpperCase(),
        border: const OutlineInputBorder(),
      ),
      onChanged: (text) async {
        final setUser = await SharedPreferences.getInstance();
        usuario = text;
        setUser.setString("users", usuario);
      },
    );
  }

  /*GET INPUT -> SENHA*/
  inputSenha() {
    String senha = "";
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: "Senha".toUpperCase(),
        border: const OutlineInputBorder(),
      ),
      obscureText: true,
      onChanged: (text) async {
        final setPass = await SharedPreferences.getInstance();
        senha = text;
        setPass.setString("password", senha);
      },
    );
  }
}
