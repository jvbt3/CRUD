class GetProduto {
  String? nome;
  String? peso;
  String? id;
  String? idSchema;
  GetProduto({
    this.nome,
    this.peso,
    this.id,
    this.idSchema
  });
  GetProduto.fromJson(Map<String, dynamic> json) {
  nome = json['nome'].toString();
  peso = json['peso'].toString();
  id = json['id'].toString();
  idSchema = json['_id'].toString();
  }
}
