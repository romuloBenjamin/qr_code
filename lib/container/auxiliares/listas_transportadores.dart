class ListarTransportadores {
  final int ids;
  final String apelido;
  final String foto;

  ListarTransportadores({
    required this.ids,
    required this.apelido,
    required this.foto,
  });

  factory ListarTransportadores.form(Map<String, dynamic> data) {
    return ListarTransportadores(
      ids: int.parse(data["ids"]),
      apelido: data["apelido"],
      foto: data["foto"],
    );
  }

  Map<String, dynamic> json() => {
        "status": this.ids,
        "data": this.apelido,
        "msn": this.foto,
      };
}
