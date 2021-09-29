import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaViewData {
  Widget listarListView(String string) {
    List<dynamic> listar = jsonDecode(string);
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  color: Color(0xffd5d5d5),
                  child: Container(
                    child: GestureDetector(
                      child: ListaViewData().cards(listar[index]),
                      onTap: () async {
                        final stores = await SharedPreferences.getInstance();
                        stores.setString(
                          "search",
                          listar[index]["ids"],
                        );
                        stores.setString(
                          "swit",
                          "search-transportador",
                        );
                        stores.setString(
                          "module",
                          "transportadores",
                        );
                        stores.setString(
                          "keys",
                          "NGqHZa8H39Kr8KHXbxpHQQpQjTxGLN",
                        );
                        Navigator.of(context)
                            .pushReplacementNamed("/transportadores");
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: listar.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget cards(listar) {
    return Container(
      width: double.infinity,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Image.network(
          "http://162.241.88.255/~wwsale/intranet/2.0/cnt-files/2.1/images/funcionarios/agregados/${listar["foto"]}",
          fit: BoxFit.fitHeight,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return CircularProgressIndicator();
          },
          errorBuilder: (context, error, stackTrace) =>
              Text("Desculpe, não localizei sua foto"),
        ),
        title: Text(
          '${listar["apelido"]}'.toUpperCase(),
        ),
      ),
    );
  }
}
