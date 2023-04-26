import 'package:flutter/material.dart';

class JogadoresForm extends StatefulWidget {
  final void Function(String) onSubmit;

  JogadoresForm(this.onSubmit);

  @override
  State<JogadoresForm> createState() => _JogadoresFormState();
}

class _JogadoresFormState extends State<JogadoresForm> {
  final nomeController = TextEditingController();

  _submitForm() {
    final nome = nomeController.text;

    if (nome.isEmpty) {
      return;
    }
    widget.onSubmit(nome);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: TextField(
            controller: nomeController,
            //para o usuario nao ter que clicar no adicionar jogador e sim no ok do teclado
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Nome do jogador',
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
            child: Text('Adicionar jogador'),
          ),
        ),
      ],
    );
  }
}
