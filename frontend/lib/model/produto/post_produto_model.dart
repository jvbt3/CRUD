import 'dart:convert';

class Produto {
  String? nome;
  String? peso;
  String? id;
  Produto({
    this.nome,
    this.peso,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'peso': peso,
      'id': id,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      nome: map['nome'] != null ? map['nome'] as String : null,
      peso: map['peso'] != null ? map['peso'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) => Produto.fromMap(json.decode(source) as Map<String, dynamic>);
}
