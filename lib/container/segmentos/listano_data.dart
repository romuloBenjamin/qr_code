import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoListasData {
  /*WIDGETS*/
  Widget listasNodata(String string) {
    return Container(
      child: Row(
        children: [
          CircularProgressIndicator(),
          Text(
            string.toString(),
          ),
        ],
      ),
    );
  }
}
