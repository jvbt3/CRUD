import 'package:crud/controller/produto/produto.controller.dart';
import 'package:crud/view/produto/produto_atualizar_view.dart';
import 'package:crud/view/produto/produto_home_view.dart';
import 'package:flutter/material.dart';

class CardProduto extends StatelessWidget {
  final String nome;
  final String peso;
  final String barcode;
  final String idSchema;

  const CardProduto({
    super.key,
    required this.nome,
    required this.peso,
    required this.barcode,
    required this.idSchema
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String idN = idSchema;
        print('produto selecionado: $idN');
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Produto: $nome",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Peso: $peso kg",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Código de barras: $barcode",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      CardProduto card = CardProduto(
                        peso: peso,
                        barcode: barcode,
                        nome: nome, 
                        idSchema: idSchema,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AtualizarProduto(cardProduto: card),
                        ),
                      );
                    },
                    child: const Icon(Icons.edit),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String idProduto = idSchema;
                      await deleteProduto(idProduto);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProdutoHomeView(),
                        ),
                      );
                    },
                    child: const Icon(Icons.delete),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
