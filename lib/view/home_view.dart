import 'package:crud/controller/cadastro_controller.dart';
import 'package:crud/view/cadastro_view.dart';
import 'package:flutter/material.dart';

import '../model/get_usuario_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  Future<List<GetUsuario>>? getUsuario;

  @override
  void initState(){
    getUsuario = leituraUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Usuários'),
          actions: [
            IconButton(onPressed: (){
              leituraUsuario();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CadastroView()));
            }, icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}