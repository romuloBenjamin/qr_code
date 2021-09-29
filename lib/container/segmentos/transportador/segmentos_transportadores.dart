import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/container/segmentos/transportador/future-data/future-dados-transportadores.dart';

class SegmentosTransportadores {
  /*SEGMENTOS HEADER*/
  Widget segmentoHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: SegmentosTransportadores()
              .getSectionTitle("Dados do Transportador"),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: FutureDataTransportadores()
              .getFutureDataTransportadores("dados-transportador"),
        ),
      ],
    );
  }

  /*SEGMENTOS TERCEIRIXACAO*/
  Widget segmentoTerceirizacao() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: SegmentosTransportadores()
              .getSectionTitle("Dados de Terceirizacao"),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: FutureDataTransportadores()
              .getFutureDataTransportadores("dados-terceirizacao"),
        ),
      ],
    );
  }

  /*GET TITLES*/
  Widget getSectionTitle(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, .8),
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      constraints: BoxConstraints(maxHeight: 25),
      child: Center(
        child: Text(title.toUpperCase()),
      ),
    );
  }
}
