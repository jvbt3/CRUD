import 'package:crud/controller/usuario.controller.dart';
import 'package:crud/view/cadastro_view.dart';
import 'package:flutter/material.dart';
import '../components/listar_usuario_components.dart';
import '../model/get_usuario_model.dart';

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
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroView(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: FutureBuilder(
          future: getUsuario,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final usuario = snapshot.data as List<GetUsuario>;
              return ListarUsuarios(usuarios: usuario);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
