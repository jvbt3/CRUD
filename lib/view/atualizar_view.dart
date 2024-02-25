import 'package:crud/view/home_view.dart';
import 'package:flutter/material.dart';
import '../controller/usuario.controller.dart';

class AtualizarView extends StatefulWidget {
  final String userId;

  const AtualizarView({super.key, required this.userId});

  @override
  State<AtualizarView> createState() => _AtualizarViewState();
}

var nomeController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();

bool? ativarBotao;

class _AtualizarViewState extends State<AtualizarView> {
  validarBotao() {
    setState(() {
      ativarBotao = nomeController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          phoneController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))
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
                decoration: const InputDecoration(
                  label: Text('Nome completo'),
                ),
                onChanged: (value) {
                  validarBotao();
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
                onChanged: (value) {
                  validarBotao();
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: const InputDecoration(
                  label: Text('Telefone'),
                ),
                onChanged: (value) {
                  validarBotao();
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: ativarBotao == true
                      ? () {
                           atualizarUsuario(
                              widget.userId, 
                              nomeController.text,
                              emailController.text, 
                              phoneController.text,
                              );
                            nomeController.clear();
                            emailController.clear();
                            phoneController.clear();
                            ativarBotao = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ),
                          );
                        }
                      : null,
                  child: const Text('Atualizar'),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
