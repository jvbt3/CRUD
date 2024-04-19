import 'dart:convert';
import 'package:crud/components/card_usuario_components.dart';
import 'package:crud/model/get_usuario_model.dart';
import 'package:crud/model/post_usuario_model.dart';
import 'package:http/http.dart' as http;

Future<Usuario> cadastroUsuario(String nome, String email, String phone) async {
  final response1 = await http.get(
    Uri.parse('https://localhost:3000/dto'),
  );
  print(response1);

  // final response = await http.post(
  //   Uri.parse('https://crudcrud.com/api/237e1ee15c264182a684f5f8ba498629/user'),
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //   body: jsonEncode(<String, String>{
  //     'nome': nome,
  //     'email': email,
  //     'phone': phone,
  //   }),
  // );

  if (response1.statusCode == 201) {
    return Usuario.fromMap(jsonDecode(response1.body) as Map<String, dynamic>);
  } else {
    throw Exception('Falha ao criar usuário');
  }
}

Future<List<GetUsuario>> leituraUsuario() async {
  final response1 = await http.get(
    Uri.parse('http://localhost:3000/dto'),
  );
  print(response1);
  // final response = await http.get(
  //   Uri.parse('https://crudcrud.com/api/237e1ee15c264182a684f5f8ba498629/user'),
  // );

  if (response1.statusCode == 200) {
    final json = jsonDecode(response1.body);

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
    CardUsuario cardUsuario) async {
      String userId = cardUsuario.id;
      print(cardUsuario.id);
  final response = await http.put(
    Uri.parse(
        'https://crudcrud.com/api/237e1ee15c264182a684f5f8ba498629/user/$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nome': cardUsuario.nome,
      'email': cardUsuario.email,
      'phone': cardUsuario.phone,
    }),
  );
  if (response.statusCode == 200) {
    print("Usuário atualizado com sucesso!");
  } else {
    print(
        "Erro ao atualizar usuário. Código de status: ${response.statusCode}");
    print(response.body);
  }
}

Future<void> deleteUsuario(String id) async {
  final response = await http.delete(
    Uri.parse(
        'https://crudcrud.com/api/237e1ee15c264182a684f5f8ba498629/user/$id'),
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
