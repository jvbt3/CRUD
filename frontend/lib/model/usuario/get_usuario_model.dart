class GetUsuario {
  String? nome;
  String? email;
  String? phone;
  String? id;
  GetUsuario({
    this.nome,
    this.email,
    this.phone,
    this.id,
  });
  GetUsuario.fromJson(Map<String, dynamic> json) {
  nome = json['nome'].toString();
  email = json['email'].toString();
  phone = json['phone'].toString();
  id = json['_id'].toString();
  }
}
