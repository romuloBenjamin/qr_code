import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code/container/segmentos/formularios/main/formulario-main.dart';

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
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 240, 240, .6),
                border: Border(
                  top: BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  bottom: BorderSide(
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 2, bottom: 2),
              width: double.infinity,
              child: Text(
                "Pesquisar Motorista".toUpperCase(),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: FormularioMain().mainFormulario(context),
          ),
        ],
      ),
    );
  }
}
