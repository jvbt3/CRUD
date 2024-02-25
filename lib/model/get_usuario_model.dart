class GetUsuario {
  String nome;
  String email;
  String phone;
  String id;
  GetUsuario({
    required this.nome,
    required this.email,
    required this.phone,
    required this.id,
  });
  GetUsuario.fromJson(Map<String, dynamic> json)
  : nome = json['nome'].toString(),
  email = json['email'].toString(),
  phone = json['phone'].toString(),
  id = json['id'].toString();
}
