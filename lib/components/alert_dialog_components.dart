import 'package:flutter/material.dart';


// ignore: must_be_immutable
class AlertDialogUser extends StatefulWidget {
   String message;
  AlertDialogUser({
    super.key,
    required this.message,
  });
  @override
  State<AlertDialogUser> createState() => _AlertDialogUserState();
}

class _AlertDialogUserState extends State<AlertDialogUser> {
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
              print('chamou!');
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
