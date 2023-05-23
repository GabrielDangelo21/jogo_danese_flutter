import 'package:flutter/material.dart';
import 'package:jogo_fodase/models/jogadores.dart';

class JogadoresList extends StatefulWidget {
  final List<Jogador> jogadores;

  JogadoresList(this.jogadores);

  @override
  State<JogadoresList> createState() => _JogadoresListState();
}

class _JogadoresListState extends State<JogadoresList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: widget.jogadores.length,
        itemBuilder: (ctx, index) {
          final jd = widget.jogadores[index];
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
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add_box_rounded),
                        color: Colors.amber,
                        onPressed: () {
                          setState(() {
                            jd.pedidas++;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle),
                        color: Colors.amber,
                        onPressed: () {
                          setState(() {
                            if (jd.pedidas <= 0) {
                              return;
                            }
                            jd.pedidas--;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text(
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                      jd.pedidas.toString()),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            jd.pontos += (5 + jd.pedidas);
                            jd.pedidas = 0;
                          });
                        },
                        icon: Icon(Icons.check_circle),
                        color: Colors.green,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            jd.pontos = jd.pontos;
                            jd.pedidas = 0;
                          });
                        },
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
                      fontSize: 16,
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
