import 'dart:convert';
import 'package:crud/model/get_usuario_model.dart';
import 'package:crud/model/post_usuario_model.dart';
import 'package:http/http.dart' as http;

Future<Usuario> cadastroUsuario(String nome, String email, String phone) async {
  final response = await http.post(
    Uri.parse('https://crudcrud.com/api/b4774ffdd38a426196ec078cb19d68c5/user'),
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

Future<List<GetUsuario>> leituraUsuario() async {
  final response = await http.get(
    Uri.parse('https://crudcrud.com/api/b4774ffdd38a426196ec078cb19d68c5/user'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    return List<GetUsuario>.from(
      json.map(
        (elemento) {
          return GetUsuario.fromJson(elemento);
        },
      ),
    );
  } else {
    throw Exception('Erro na leitura dos usuários');
  }
}

Future<GetUsuario> atualizarUsuario(String id, String nome, String email, String phone) async {
  final response = await http.put(
    Uri.parse('https://crudcrud.com/api/b4774ffdd38a426196ec078cb19d68c5/user/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'nome': nome,
      'email': email,
      'phone': phone,
    }),
  );

  if (response.statusCode == 200) {
    return GetUsuario.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Falha ao atualizar usuário - Código ${response.statusCode}');
  }
}




