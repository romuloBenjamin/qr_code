import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyMains extends StatefulWidget {
  const BodyMains({Key? key}) : super(key: key);

  @override
  State<BodyMains> createState() => _BodyMainsState();
}

class _BodyMainsState extends State<BodyMains> {
  String nomeMotorista = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
        ),
      ),
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Text(
              "Pesquisar Motorista",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Expanded(
            child: Form(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: null,
                          hintText: "Pesquise pelo nome do Motorista...",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          nomeMotorista = text;
                        },
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: ElevatedButton(
                                style: null,
                                onPressed: null,
                                child: Text("SCAN"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: ElevatedButton(
                                style: null,
                                onPressed: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString(
                                    "search",
                                    nomeMotorista,
                                  );
                                  prefs.setString(
                                    "swit",
                                    "search-intranet",
                                  );
                                  prefs.setString(
                                    "module",
                                    "results",
                                  );
                                  prefs.setString(
                                    "keys",
                                    "NGqHZa8H39Kr8KHXbxpHQQpQjTxGLN",
                                  );
                                  FocusScope.of(context).requestFocus(
                                    new FocusNode(),
                                  );
                                  Navigator.of(context)
                                      .pushReplacementNamed("/listarAgregados");
                                },
                                child: Text("Pesquisar"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
