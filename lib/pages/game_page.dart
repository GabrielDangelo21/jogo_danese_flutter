import 'package:flutter/material.dart';
import 'package:jogo_fodase/components/round_form.dart';
import 'package:jogo_fodase/models/acertos.dart';

import '../components/jogadores_list.dart';
import '../models/jogadores.dart';

class GamePage extends StatefulWidget {
  List<Jogador> jogadores = [];

  GamePage({super.key, required this.jogadores});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Jogo Dane-se'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            JogadoresList(widget.jogadores),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(width: 2, color: Colors.amber),
              ),
              onPressed: () => _openJogadorFormModal(context),
              child: Text(
                'Nova rodada',
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _newRound(String acertos) {
    final acertei = Acertos(
      acertos: acertos,
    );
    for (int i = 0; i < widget.jogadores.length; i++) {}
    setState(() {});
  }

  _openJogadorFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return RoundForm(_newRound);
        });
  }
}
