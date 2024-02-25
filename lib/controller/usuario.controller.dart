import 'dart:convert';
import 'package:crud/model/get_usuario_model.dart';
import 'package:crud/model/post_usuario_model.dart';
import 'package:http/http.dart' as http;

Future<Usuario> cadastroUsuario(String nome, String email, String phone) async {
  final response = await http.post(
    Uri.parse('https://crudcrud.com/api/ab9d95c4863e4b39a317184a59e34351/user'),
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
    Uri.parse('https://crudcrud.com/api/ab9d95c4863e4b39a317184a59e34351/user'),
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

Future<void> atualizarUsuario(
    String id, String nome, String email, String phone) async {
  final response = await http.put(
    Uri.parse(
        'https://crudcrud.com/api/ab9d95c4863e4b39a317184a59e34351/user/$id'),
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
    print("Usuário deletado com sucesso!");
  } else {
    print(
        "Erro ao atualizar usuário. Código de status: ${response.statusCode}");
    print(response.body);
  }
}

Future<void> deleteUsuario(String id) async {
  final response = await http.delete(
    Uri.parse(
        'https://crudcrud.com/api/ab9d95c4863e4b39a317184a59e34351/user/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print("Usuário deletado com sucesso!");
  } else {
    print("Erro ao deletar usuário. Código de status: ${response.statusCode}");
    print(response.body);
  }
}
