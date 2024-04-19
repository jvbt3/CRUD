import 'dart:convert';
import 'package:crud/components/produto/card_produto_components.dart';
import 'package:crud/model/produto/get_produto_model.dart';
import 'package:crud/model/produto/post_produto_model.dart';
import 'package:http/http.dart' as http;

Future<Produto> cadastroProduto(String nome, String peso, String id) async {
  final response = await http.post(
    Uri.parse('https://crudcrud.com/api/90c21339217a4414b89a255d9127c3e4/produto'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nome': nome,
      'peso': peso,
      'id': id,
    }),
  );

  if (response.statusCode == 201) {
    return Produto.fromMap(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Falha ao criar Produto');
  }
}

Future<List<GetProduto>> leituraProduto() async {
  final response = await http.get(
    Uri.parse('https://crudcrud.com/api/90c21339217a4414b89a255d9127c3e4/produto'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    return List<GetProduto>.from(
      json.map(
        (elemento) {
          return GetProduto.fromJson(elemento);
        },
      ),
    );
  } else {
    throw Exception('Erro na leitura dos usuários');
  }
}

Future<void> atualizarProduto(
    CardProduto cardProduto) async {
      String productoId = cardProduto.idSchema;
      print(cardProduto.id);
  final response = await http.put(
    Uri.parse(
        'https://crudcrud.com/api/90c21339217a4414b89a255d9127c3e4/produto/$productoId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nome': cardProduto.nome,
      'peso': cardProduto.peso,
      'id': cardProduto.id,
    }),
  );
  if (response.statusCode == 200) {
    print("produto atualizado com sucesso!");
  } else {
    print(
        "Erro ao atualizar produto. Código de status: ${response.statusCode}");
    print(response.body);
  }
}

Future<void> deleteProduto(String id) async {
  final response = await http.delete(
    Uri.parse(
        'https://crudcrud.com/api/90c21339217a4414b89a255d9127c3e4/produto/$id'),
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
