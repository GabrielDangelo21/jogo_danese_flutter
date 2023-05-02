import 'package:flutter/material.dart';

class RoundForm extends StatefulWidget {
  final void Function(int) onSubmit;

  RoundForm(this.onSubmit);

  @override
  State<RoundForm> createState() => _RoundFormState();
}

class _RoundFormState extends State<RoundForm> {
  final pedidasController = TextEditingController();

  _submitForm() {
    final pedidas = int.parse(pedidasController.text);
    // final pedidaFormatada = int.parse(pedidas);

    if (pedidas.toString().isEmpty) {
      return;
    }
    widget.onSubmit(pedidas);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: TextField(
            autofocus: true,
            controller: pedidasController,
            //para o usuario nao ter que clicar no adicionar jogador e sim no ok do teclado
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Quantas vai fazer?',
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
