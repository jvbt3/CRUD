import 'dart:convert';
import 'package:crud/model/usuario_model.dart';
import 'package:http/http.dart' as http;

Future<Usuario> cadastroUsuario(String nome, String email, String phone) async{
  final response = await http.post(
    Uri.parse(
        'https://crudcrud.com/api/95ed551fc434475db9b1a13690084aed/usuarios'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nome': nome,
      'email': email,
      'phone': phone,
    }),
  );

  if (response.statusCode == 201) {
    return Usuario.fromMap(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Falha ao criar usuário');
  }
}
