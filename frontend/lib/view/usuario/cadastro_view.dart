import 'package:crud/components/usuario/alert_dialog_components.dart';
import 'package:crud/controller/usuario/usuario.controller.dart';
import 'package:crud/model/usuario/get_usuario_model.dart';
import 'package:crud/view/usuario/home_view.dart';
import 'package:flutter/material.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final _formKey = GlobalKey<FormState>();

  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  bool? validado;

  bool? ativarBotao;

  List<GetUsuario>? teste;

  validarBotao() {
    setState(() {
      ativarBotao = nomeController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          phoneController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: nomeController,
                  decoration:
                      const InputDecoration(label: Text('Nome completo')),
                  onChanged: (value) {
                    validarBotao();
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(label: Text('E-mail')),
                  validator: (value) {
                    final regex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                    if (!regex.hasMatch(value!)) {
                      return 'Email inválido!';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    validarBotao();
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  validator: (value) {
                    final phoneRegex = RegExp(r'^\+\d{2}\d{2}\d{5}\d{4}$');
                    if (!phoneRegex.hasMatch(value!)) {
                      return 'Número de telefone inválido. O formato correto é +xxxxxxxxxxxxx';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(label: Text('Telefone')),
                  onChanged: (value) {
                    validarBotao();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ElevatedButton(
                    onPressed: ativarBotao == true
                        ? () async {
                            if (_formKey.currentState?.validate() == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Email válido!')),
                              );
                              setState(
                                () {
                                  ativarBotao = false;
                                },
                              );
                              try {
                                await cadastroUsuario(nomeController.text,
                                    emailController.text, phoneController.text);
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialogUser(
                                          message:
                                              'Sucesso ao cadastrar usuário!'),
                                );
                              } catch (_) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialogUser(
                                          message:
                                              'Erro ao cadastrar usuário!'),
                                );
                              }
                              setState(() {
                                nomeController.clear();
                                emailController.clear();
                                phoneController.clear();
                                ativarBotao = true;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeView(),
                                ),
                              );
                            } else {
                              ativarBotao == false;
                            }
                          }
                        : null,
                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}