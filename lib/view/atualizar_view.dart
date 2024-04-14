import 'package:flutter/material.dart';
import '../components/alert_dialog_components.dart';
import '../controller/usuario.controller.dart';
import '../components/card_usuario_components.dart';
import 'home_view.dart';

class AtualizarView extends StatefulWidget {
  final CardUsuario cardUser;

  const AtualizarView({super.key, required this.cardUser});

  @override
  State<AtualizarView> createState() => _AtualizarViewState();
}

class _AtualizarViewState extends State<AtualizarView> {
  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  bool? ativarBotao;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController(text: widget.cardUser.nome);
    emailController = TextEditingController(text: widget.cardUser.email);
    phoneController = TextEditingController(text: widget.cardUser.phone);
    validarBotao();
  }

  void validarBotao() {
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
            icon: const Icon(Icons.arrow_back),
          )
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
                labelText: 'Nome completo',
              ),
              onChanged: (value) {
                validarBotao();
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
              ),
              onChanged: (value) {
                validarBotao();
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Telefone',
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
                        setState(() {
                          ativarBotao = false;
                        });
                        try {
                          CardUsuario attCard = CardUsuario(nome: nomeController.text, 
                          email: emailController.text, phone: phoneController.text, id: widget.cardUser.id);
                                                  
                        ativarBotao = false;

                          await atualizarUsuario(attCard);
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialogUser(message: 'Sucesso ao atualizar usuário!'),
                          );
                        } catch (_) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialogUser(message: 'Erro ao atualizar usuário!'),
                          );
                        }
                        setState(() {
                          nomeController.clear();
                          emailController.clear();
                          phoneController.clear();
                          validarBotao();
                        });
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
