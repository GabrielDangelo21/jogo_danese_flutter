import 'package:flutter/material.dart';

import '../components/jogadores_list.dart';
import '../models/jogadores.dart';

class GamePage extends StatefulWidget {
  List<Jogador> jogadores;

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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: widget.jogadores.length,
              itemBuilder: (ctx, index) {
                final jd = widget.jogadores[index];
                return JogadoresList(widget.jogadores);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(width: 2, color: Colors.amber),
              ),
              onPressed: () => {},
              child: Text(
                'Encerrar',
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
