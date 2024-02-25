import 'package:crud/controller/usuario.controller.dart';
import 'package:crud/model/post_usuario_model.dart';
import 'package:crud/view/home_view.dart';
import 'package:flutter/material.dart';

import '../model/get_usuario_model.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

var nomeController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();

bool? ativarBotao;

Future<Usuario>? _futureUsuario;

List<GetUsuario>? teste;

class _CadastroViewState extends State<CadastroView> {

  validarBotao(){
    setState(() {
      ativarBotao = nomeController.text.isNotEmpty && emailController.text.isNotEmpty && phoneController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
           IconButton(onPressed: (){
            Navigator.pop(context);
           }, icon: const Icon(Icons.arrow_back))
          ],
          title: const Text('Cadastro'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(label: Text('Nome completo')),
                onChanged: (value) {
                  validarBotao();
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(label: Text('E-mail')),
                onChanged: (value) {
                  validarBotao();
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: const InputDecoration(label: Text('Telefone')),
                onChanged: (value) {
                  validarBotao();
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: ativarBotao == true ? () async {
                            await cadastroUsuario(
                                nomeController.text,
                                emailController.text,
                                phoneController.text);
                            nomeController.clear();
                            emailController.clear();
                            phoneController.clear();
                            ativarBotao = false;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
                        } : null,
                  child: const Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
