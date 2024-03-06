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
Cada manipulação poderá ser visualizada acessando o endpoint.

OBS: O CRUD CRUD em sua versão gratuita, possui um tempo limite de validade de 24 horas e 100 requisições. No modo anônimo é possível gerar vários endpoints.

Para realizar o download do sdk do flutter, basta acessar https://docs.flutter.dev/get-started/install e baixar o sdk. Ao baixar, extraia a pasta flutter para dentro do C:, abra as variaveis de ambiente do sistema, e adicionar o caminho C:\flutter\bin. Feito isso, execute o comando "flutter doctor" no cmd, onde uma lista de requisitos deverá ser atendido, como por exemplo:

[√] Flutter (Channel stable, 3.19.0, on Microsoft Windows [versÆo 10.0.19045.4046], locale en-US)
[√] Windows Version (Installed version of Windows is version 10 or higher)
[√] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[√] Chrome - develop for the web
[√] Visual Studio - develop Windows apps (Visual Studio Community 2022 17.2.3)
[√] Android Studio (version 2023.1)
[√] VS Code (version 1.86.2)
[√] Network resources

Para o android toolchain, eu recomendo que abra o Android Studio, na parte do SDK Manager > SDK Tools e instale o Android SDK Build-Tools, Android SDK Command-line. Após instalado, basta seguir o que é falado no comando flutter doctor.

Qualquer dúvida, também há disponivel todo o passo a passo de instalação do SDK na documentação oficial do flutter: https://docs.flutter.dev/get-started/install/windows/desktop?tab=download ou https://medium.com/flutter-comunidade-br/instalando-e-configurando-flutter-no-windows-cae74711df1e

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
