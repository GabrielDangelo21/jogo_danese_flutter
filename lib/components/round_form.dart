import 'package:flutter/material.dart';

class RoundForm extends StatefulWidget {
  final void Function(String) onSubmit;

  RoundForm(this.onSubmit);

  @override
  State<RoundForm> createState() => _RoundFormState();
}

class _RoundFormState extends State<RoundForm> {
  final acertosController = TextEditingController();

  _submitForm() {
    final acertos = acertosController.text;

    if (acertos.isEmpty) {
      return;
    }
    widget.onSubmit(acertos);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: TextField(
            controller: acertosController,
            //para o usuario nao ter que clicar no adicionar jogador e sim no ok do teclado
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Quantas acertou',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.teal),
            ),
            onPressed: _submitForm,
            child: Text('Confirmar'),
          ),
        ),
      ],
    );
  }
}
