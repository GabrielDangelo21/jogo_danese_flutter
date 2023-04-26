import 'package:flutter/material.dart';
import 'package:jogo_fodase/models/jogadores.dart';

class JogadoresList extends StatelessWidget {
  final List<Jogador> jogadores;

  JogadoresList(this.jogadores);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: jogadores.length,
        itemBuilder: (ctx, index) {
          final jd = jogadores[index];
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    jd.nome,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    jd.pontos.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
