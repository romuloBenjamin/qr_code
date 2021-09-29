import 'package:flutter/material.dart';
import 'package:qr_code/container/segmentos/gerar_dados_transportadores.dart';

class BodyTransportadores extends StatefulWidget {
  const BodyTransportadores({Key? key}) : super(key: key);

  @override
  State<BodyTransportadores> createState() => _BodyTransportadoresState();
}

class _BodyTransportadoresState extends State<BodyTransportadores> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10),
      child: DadosTransportadores().transportadores_dados(),
    );
  }
}
