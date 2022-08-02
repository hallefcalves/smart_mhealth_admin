import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  
  CustomAlertDialog(this.title, this.content, this.confirmText, this.cancelText, this.symbol, {Key? key}) : super(key: key);

  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final IconData symbol;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: Text(cancelText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(confirmText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
