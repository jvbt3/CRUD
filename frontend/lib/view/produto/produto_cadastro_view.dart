import 'package:crud/components/produto/produto_alert_dialog_components.dart';
import 'package:crud/controller/produto/produto.controller.dart';
import 'package:crud/view/produto/produto_home_view.dart';
import 'package:flutter/material.dart';

class ProdutoCadastroView extends StatefulWidget {
  const ProdutoCadastroView({super.key});

  @override
  State<ProdutoCadastroView> createState() => _ProdutoCadastroViewState();
}

class _ProdutoCadastroViewState extends State<ProdutoCadastroView> {
  final _formKey = GlobalKey<FormState>();
  

  var nomeController = TextEditingController();
  var pesoController = TextEditingController();
  var idController = TextEditingController();

  bool? ativarBotao;

  validarBotao() {
    setState(() {
      ativarBotao = nomeController.text.isNotEmpty &&
          pesoController.text.isNotEmpty &&
          idController.text.isNotEmpty;
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
                  decoration: const InputDecoration(label: Text('Nome do Produto')),
                  onChanged: (value) {
                    validarBotao();
                  },
                ),
                TextFormField(
                  controller: pesoController,
                  decoration: const InputDecoration(label: Text('Peso')),
                  validator: (value) {
                    final phoneRegex = RegExp(r'^\d+(\.\d+)?$');
                    if (!phoneRegex.hasMatch(value!)) {
                      return 'Peso inválido. O formato correto é xxxx';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    validarBotao();
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: idController,
                  decoration: const InputDecoration(label: Text('Id')),
                  validator: (value) {
                    final phoneRegex = RegExp(r'^\d{6}$');
                    if (!phoneRegex.hasMatch(value!)) {
                      return 'Número de barras inválido. O formato correto é xxxxxx';
                    }
                    return null;
                  },
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
                              await cadastroProduto(nomeController.text,
                                  pesoController.text, idController.text);
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    AlertDialogProduto(message: 'Sucesso ao cadastrar produto!'),
                              );
                            } catch (_) {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    AlertDialogProduto(message: 'Erro ao cadastrar produto!'),
                              );
                            }
                            setState(() {
                              nomeController.clear();
                              pesoController.clear();
                              idController.clear();
                              ativarBotao = true;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProdutoHomeView(),
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
