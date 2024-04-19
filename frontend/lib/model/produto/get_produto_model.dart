class GetProduto {
  String? nome;
  String? peso;
  String? barcode;
  String? idSchema;
  GetProduto({
    this.nome,
    this.peso,
    this.barcode,
    this.idSchema
  });
  GetProduto.fromJson(Map<String, dynamic> json) {
  nome = json['nome'].toString();
  peso = json['peso'].toString();
  barcode = json['barcode'].toString();
  idSchema = json['_id'].toString();
  }
}
