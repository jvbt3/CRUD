import 'package:crud/controller/usuario/usuario.controller.dart';
import 'package:crud/view/produto/produto_home_view.dart';
import 'package:crud/view/usuario/cadastro_view.dart';
import 'package:flutter/material.dart';
import '../../components/usuario/listar_usuario_components.dart';
import '../../model/usuario/get_usuario_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<GetUsuario>>? getUsuario;

  @override
  void initState() {
    getUsuario = leituraUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Usuários'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProdutoHomeView(),
                    ),
                  );
                },
                child: const Text('Ir para Produtos'))
          ],
        ),
        body: FutureBuilder(
          future: getUsuario,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else if (!snapshot.hasData ||
                (snapshot.data as List<GetUsuario>).isEmpty) {
              return const Center(
                child: Text(
                  'Nenhum usuário cadastrado.',
                  style: TextStyle(fontSize: 16),
                ),
              );
            } else {
              final usuario = snapshot.data as List<GetUsuario>;
              return ListarUsuarios(usuarios: usuario);
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CadastroView(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
