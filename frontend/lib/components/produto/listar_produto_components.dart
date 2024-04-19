import 'package:crud/components/produto/card_produto_components.dart';
import 'package:crud/model/produto/get_produto_model.dart';
import 'package:flutter/material.dart';

class ListarProdutos extends StatelessWidget {
  const ListarProdutos({
    super.key,
    required this.produtos,
  });

  final List<GetProduto> produtos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        final produto = produtos[index];
        return CardProduto(
          nome: produto.nome!,
          peso: produto.peso!,
          barcode: produto.barcode!,
          idSchema: produto.idSchema!,
        );
      },
    );
  }
}
