import 'package:flutter/cupertino.dart';

class DadosTransportador {
  Widget dados_do_transportador(jdata) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(176, 176, 176, .6),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: DadosTransportador().getTransportadorImage(jdata),
          ),
          Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: DadosTransportador().getLineDadosTransportador(
                      jdata["apelido"].toString(), "Transp.:"),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: DadosTransportador().getLineDadosTransportador(
                      jdata["nome"].toString(), "Nome:"),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: DadosTransportador().getLineDadosTransportador(
                      jdata["ids"].toString(), "ID:"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /*GET IMAGE TRANSPORTADOR*/
  Widget getTransportadorImage(jdata) {
    return Container(
      child: Image.network(
          "http://162.241.88.255/~wwsale/android/1.5/cnt-files/1.5/images/agregados/${jdata["foto"]}"),
    );
  }

  Widget getLineDadosTransportador(data, String title) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(236, 236, 236, 1),
          ),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(data),
          )
        ],
      ),
    );
  }
}
