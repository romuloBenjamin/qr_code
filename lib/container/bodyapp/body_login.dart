import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_code/process/validate.dart';

class Body_login extends StatefulWidget {
  const Body_login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyAPPState();
}

//BODY APPS
class _BodyAPPState extends State<Body_login> {
  String usuario = "";
  String senha = "";
  String portao = 'Portão 01';
  String valida = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        width: 300,
        height: 200,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "usuario".toUpperCase(),
                    hintText: "entre com o usuário".toLowerCase(),
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    usuario = text;
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "senha".toUpperCase(),
                    hintText: "Digite a senha",
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    senha = text;
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    DropdownButton(
                      value: portao,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          portao = newValue!;
                        });
                      },
                      items: <String>['Portão 01', 'Portão 02', 'Portão 03']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // ignore: prefer_typing_uninitialized_variables
                        var validaRender;
                        valida = ValidarFormularios()
                            .validarFormulario(usuario, senha, portao);
                        validaRender = jsonDecode(valida);
                        if (validaRender["status"] == "1") {
                          Navigator.of(context)
                              .pushReplacementNamed('/mainpage');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(validaRender["message"].toString()),
                            ),
                          );
                        }
                      },
                      child: const Text("Logar"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
