import 'package:flutter/material.dart';

class SimpleAlertDialog extends StatelessWidget {
  final Icon icon;
  final String title;
  final String content;

  const SimpleAlertDialog(
      {super.key,
      required this.icon,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon,
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text("Cancel")),
        TextButton(
            onPressed: () => Navigator.pop(context, 'Confirm'),
            child: const Text("Confirm")),
      ],
    );
    ;
  }
}
