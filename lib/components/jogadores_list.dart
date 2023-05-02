import 'package:flutter/material.dart';
import 'package:jogo_fodase/components/round_form.dart';
import 'package:jogo_fodase/models/jogadores.dart';

class JogadoresList extends StatefulWidget {
  final List<Jogador> jogadores;

  JogadoresList(this.jogadores);

  @override
  State<JogadoresList> createState() => _JogadoresListState();
}

class _JogadoresListState extends State<JogadoresList> {
  int pedidaJogador = 0;

  addPedidas(int pedidas) {
    setState(() {
      pedidaJogador += pedidas;
    });
    Navigator.of(context).pop();
  }

  openRoundFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return RoundForm(addPedidas);
        });
  }

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
                  child: IconButton(
                    icon: Icon(Icons.add_box_rounded),
                    color: Colors.amber,
                    onPressed: () => openRoundFormModal(context),
                  ),
                ),
                Container(
                  child: Text(
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                      pedidaJogador.toString()),
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
