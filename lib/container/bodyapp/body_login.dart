import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_code/container/segmentos/formularios/login/formulario-login.dart';
import 'package:qr_code/process/dataListas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body_login extends StatefulWidget {
  const Body_login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyAPPState();
}

//BODY APPS
class _BodyAPPState extends State<Body_login> {
  String portao = 'Portão 01';
  String dadosLogin = "";
  String validarUsuario = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                alignment: Alignment.topCenter,
                child: FormularioLogin().inputUsuario(),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                alignment: Alignment.topCenter,
                child: FormularioLogin().inputSenha(),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: DropdownButton(
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
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value.toUpperCase(),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ElevatedButton(
                        onPressed: () async {
                          final stores = await SharedPreferences.getInstance();
                          var dadosLogin =
                              "{\"usuario\":\"${stores.getString("users").toString()}\", \"senha\":\"${stores.getString("password").toString()}\",\"gates\":\"${portao.toString()}\"}";
                          stores.setString("search", dadosLogin);
                          stores.setString("swit", "logar-webserver");
                          String validarUsuario =
                              await GeradorListas().gerarListas();
                        },
                        child: Text("Logar".toUpperCase()),
                      ),
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
