import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AlertDialogProduto extends StatefulWidget {
   String message;
  AlertDialogProduto({
    super.key,
    required this.message,
  });
  @override
  State<AlertDialogProduto> createState() => _AlertDialogProdutoState();
}

class _AlertDialogProdutoState extends State<AlertDialogProduto> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.message),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
