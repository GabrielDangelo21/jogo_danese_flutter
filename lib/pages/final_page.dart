import 'package:flutter/material.dart';
import 'package:jogo_fodase/models/jogadores.dart';

class FinalPage extends StatefulWidget {
  final List<Jogador> jogadores;

  FinalPage(this.jogadores);

  @override
  State<FinalPage> createState() => _FinalPage();
}

class _FinalPage extends State<FinalPage> {
  List<Jogador> ordernarLista(List<Jogador> lista) {
    List<Jogador> ordernado = lista.toList();
    ordernado.sort((a, b) => a.pontos.compareTo(b.pontos));
    print(ordernado);
    return ordernado;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Card(
        child: Text(''),
      ),
    );
  }
}
