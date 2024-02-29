# crud

Projeto desenvolvido para fins de estudos sobre requisições.

Para utilizar as funções GET, POST, DELETE e UPDTAE, é necessário acessar https://crudcrud.com/, onde será gerado um endpoint para as requisições. Após copiar as requisições é necessário ir na controller do projeto e trocar as url's, EX: 

Future<Usuario> cadastroUsuario(String nome, String email, String phone) async {
  final response = await http.post(
    Uri.parse('https://crudcrud.com/api/ab9d95c4863e4b39a317184a59e34351/user'), //Lembre-se de deixar "/user" para simular uma rota.
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },

Após trocar as url's, basta salvar e testar as requisições.

OBS: O CRUD CRUD em sua versão gratuita, possui um tempo limite de validade de 24 horas e 100 requisições. No modo anônimo é possível gerar vários endpoints.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
