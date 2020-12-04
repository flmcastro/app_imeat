class Cardapio {
  String id;
  String categoria;
  String ingredientes;
  String nome;
  int valor;

  Cardapio(Map<String, dynamic> map) {
    id = map["id"];
    categoria = map["categoria"];
    ingredientes = map["ingredientes"];
    nome = map["nome"];
    valor = map["valor"];
  }
}
