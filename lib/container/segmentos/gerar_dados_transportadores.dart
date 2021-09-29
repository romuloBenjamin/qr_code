import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/container/segmentos/transportador/segmentos_transportadores.dart';

class DadosTransportadores {
  Widget transportadores_dados() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(maxHeight: 180),
              child: SegmentosTransportadores().segmentoHeader(),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: SegmentosTransportadores().segmentoTerceirizacao(),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text("CHANGE TO: dados registro"),
            ),
          )
        ],
      ),
    );
  }
}
