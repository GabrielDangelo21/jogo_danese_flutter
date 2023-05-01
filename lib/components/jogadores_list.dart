import 'package:flutter/material.dart';
import 'package:jogo_fodase/models/jogadores.dart';

class JogadoresList extends StatelessWidget {
  final List<Jogador> jogadores;
  int pedidas = 0;

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
                  width: 100,
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
                  child: Text(
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                      pedidas.toString()),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => {},
                        icon: Icon(Icons.check_circle),
                        color: Colors.green,
                      ),
                      IconButton(
                        onPressed: () => {},
                        icon: Icon(Icons.close_rounded),
                        color: Colors.red,
                      ),
                    ],
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
