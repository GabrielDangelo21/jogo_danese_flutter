import 'package:flutter/material.dart';
import 'package:jogo_fodase/models/jogadores.dart';

class FinalPage extends StatefulWidget {
  final List<Jogador> jogadores;

  FinalPage(this.jogadores);

  @override
  State<FinalPage> createState() => _FinalPage();
}

class _FinalPage extends State<FinalPage> {
  List? get ordenado => null;

  List<Jogador> ordernarLista(List<Jogador> lista) {
    List<Jogador> ordernado = lista.toList();
    ordernado.sort((a, b) => a.pontos.compareTo(b.pontos));
    return ordernado;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: widget.jogadores.length,
        itemBuilder: (ctx, index) {
          // final jd = widget.jogadores[index];
          return Card(
            child: Text(ordenado as String),
          );
        },
      ),
    );
  }
}
