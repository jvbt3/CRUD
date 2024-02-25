import 'package:crud/view/home_view.dart';
import 'package:flutter/material.dart';
import '../controller/usuario.controller.dart';

class AtualizarView extends StatefulWidget {
  final String userId;

  const AtualizarView({super.key, required this.userId});

  @override
  State<AtualizarView> createState() => _AtualizarViewState();
}

class _AtualizarViewState extends State<AtualizarView> {
  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  bool? ativarBotao;

  atualizarUser() {
    setState(() async {});
  }

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
        title: const Text('Atualizar'),
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
                    ? () async {
                        await atualizarUsuario(
                          widget.userId,
                          nomeController.text,
                          emailController.text,
                          phoneController.text,
                        );
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
