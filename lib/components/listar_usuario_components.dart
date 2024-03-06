import 'package:crud/model/get_usuario_model.dart';
import 'package:flutter/material.dart';
import 'card_usuario_components.dart';

class ListarUsuarios extends StatelessWidget {
  const ListarUsuarios({
    super.key,
    required this.usuarios,
  });

  final List<GetUsuario> usuarios;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (context, index) {
        final usuario = usuarios[index];
        return CardUsuario(
          nome: usuario.nome!,
          email: usuario.email!,
          phone: usuario.phone!,
          id: usuario.id!,
        );
      },
    );
  }
}
