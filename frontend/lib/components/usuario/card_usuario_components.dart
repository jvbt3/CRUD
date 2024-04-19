import 'package:crud/view/usuario/atualizar_view.dart';
import 'package:crud/view/usuario/home_view.dart';
import 'package:flutter/material.dart';

import '../../controller/usuario/usuario.controller.dart';

class CardUsuario extends StatelessWidget {
  final String nome;
  final String email;
  final String phone;
  final String id;

  const CardUsuario({
    super.key,
    required this.nome,
    required this.email,
    required this.phone,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String idN = id;
        print('usuário selecionado: $idN');
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
                    "Nome: $nome",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Email: $email",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Número: $phone",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "id: $id",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      CardUsuario card = CardUsuario(
                        email: email,
                        id: id,
                        nome: nome,
                        phone: phone,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AtualizarView(cardUser: card),
                        ),
                      );
                    },
                    child: const Icon(Icons.edit),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String idUser = id;
                      await deleteUsuario(idUser);
                      Navigator.pushReplacement(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
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
