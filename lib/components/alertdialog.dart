import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  
  const CustomAlertDialog(this.title, this.content, this.confirmText, this.cancelText, this.symbol, this.destino, {Key? key}) : super(key: key);

  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final IconData symbol;
  final dynamic destino;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: (() {
          List<Widget> botoes = [];
          if(cancelText!=""){
            botoes.add(TextButton(
            child: Text(cancelText),
            onPressed: () {
              Navigator.of(context).pop();
                },
            ),);
          }
          botoes.add(
            TextButton(
              child: Text(confirmText),
              onPressed: () {
                Navigator.of(context).pop();
                if(destino!=null){
                  destino();
                }
              },
            ),);
          return botoes;
        }())
    );
  }
}
