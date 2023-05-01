import 'package:flutter/material.dart';
import 'package:jogo_fodase/components/round_form.dart';

import '../components/jogadores_list.dart';
import '../models/jogadores.dart';

class GamePage extends StatefulWidget {
  List<Jogador> jogadores = [];

  GamePage({super.key, required this.jogadores});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int pedidaJogador = 0;

  addPedidas(int pedidas) {
    setState(() {
      pedidaJogador += pedidas;
    });
    Navigator.of(context).pop();
  }

  _openRoundFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return RoundForm(addPedidas);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Jogo Dane-se'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: widget.jogadores.length,
              itemBuilder: (ctx, index) {
                // final jd = widget.jogadores[index];
                return JogadoresList(widget.jogadores);
              },
            ),
          ),
          Text(pedidaJogador.toString()),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(width: 2, color: Colors.amber),
            ),
            onPressed: () => _openRoundFormModal(context),
            child: Text(
              'Nova rodada',
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ],
      ),
    );
  }
}
