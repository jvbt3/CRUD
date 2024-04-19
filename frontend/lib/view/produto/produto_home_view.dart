import 'package:crud/components/produto/listar_produto_components.dart';
import 'package:crud/controller/produto/produto.controller.dart';
import 'package:crud/model/produto/get_produto_model.dart';
import 'package:crud/view/produto/produto_cadastro_view.dart';
import 'package:crud/view/start_view.dart';
import 'package:crud/view/usuario/home_view.dart';
import 'package:flutter/material.dart';

class ProdutoHomeView extends StatefulWidget {
  const ProdutoHomeView({super.key});

  @override
  State<ProdutoHomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<ProdutoHomeView> {
  Future<List<GetProduto>>? getProduto;

  @override
  void initState() {
    getProduto = leituraProduto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Produtos'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StartView(),
                    ),
                  );
                },
                child: const Text('Ir para Inicio')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
                child: const Text('Ir para Usuários')),
          ],
        ),
        body: FutureBuilder(
          future: getProduto,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else if (!snapshot.hasData || (snapshot.data as List<GetProduto>).isEmpty) {
              return const Center(
                child: Text(
                  'Nenhum Produto cadastrado.',
                  style: TextStyle(fontSize: 16),
                ),
              );
            } else {
              final produto = snapshot.data as List<GetProduto>;
              return ListarProdutos(produtos: produto);
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProdutoCadastroView(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
