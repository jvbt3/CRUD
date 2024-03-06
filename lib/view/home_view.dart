import 'package:crud/controller/usuario.controller.dart';
import 'package:crud/view/cadastro_view.dart';
import 'package:flutter/material.dart';
import '../components/listar_usuario_components.dart';
import '../model/get_usuario_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key});

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
            } else if (!snapshot.hasData || (snapshot.data as List<GetUsuario>).isEmpty) {
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
