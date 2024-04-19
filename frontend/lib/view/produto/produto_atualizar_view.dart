import 'package:crud/components/produto/card_produto_components.dart';
import 'package:crud/components/produto/produto_alert_dialog_components.dart';
import 'package:crud/controller/produto/produto.controller.dart';
import 'package:crud/view/produto/produto_home_view.dart';
import 'package:flutter/material.dart';

class AtualizarProduto extends StatefulWidget {
  final CardProduto cardProduto;

  const AtualizarProduto({Key? key, required this.cardProduto}) : super(key: key);

  @override
  State<AtualizarProduto> createState() => _AtualizarProdutoState();
}

class _AtualizarProdutoState extends State<AtualizarProduto> {
  var nomeController = TextEditingController();
  var pesoController = TextEditingController();
  var idController = TextEditingController();

  bool? ativarBotao;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController(text: widget.cardProduto.nome);
    pesoController = TextEditingController(text: widget.cardProduto.peso);
    idController = TextEditingController(text: widget.cardProduto.id);
    validarBotao();
  }

  void validarBotao() {
    setState(() {
      ativarBotao = nomeController.text.isNotEmpty &&
          pesoController.text.isNotEmpty &&
          idController.text.isNotEmpty;
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
                labelText: 'Nome do Produto',
              ),
              onChanged: (value) {
                validarBotao();
              },
            ),
            TextFormField(
              controller: pesoController,
              decoration: const InputDecoration(
                labelText: 'Peso',
              ),
              onChanged: (value) {
                validarBotao();
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'Código de barras',
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
                          CardProduto attCard = CardProduto(nome: nomeController.text, 
                          peso: pesoController.text, id: idController.text, idSchema: widget.cardProduto.idSchema);
                                                  
                        ativarBotao = false;

                          await atualizarProduto(attCard);
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialogProduto(message: 'Sucesso ao atualizar Produto!'),
                          );
                        } catch (_) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialogProduto(message: 'Erro ao atualizar Produto!'),
                          );
                        }
                        setState(() {
                          nomeController.clear();
                          pesoController.clear();
                          idController.clear();
                          validarBotao();
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProdutoHomeView(),
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
