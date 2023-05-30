import 'package:flutter/material.dart';
import 'package:jogo_fodase/models/jogadores.dart';

class JogadoresListClassificacao extends StatefulWidget {
  final List<Jogador> jogadores;

  JogadoresListClassificacao(this.jogadores);

  @override
  State<JogadoresListClassificacao> createState() =>
      _JogadoresListClassificacaoState();
}

class _JogadoresListClassificacaoState
    extends State<JogadoresListClassificacao> {
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
      child: ListView.builder(
        itemCount: widget.jogadores.length,
        itemBuilder: (ctx, index) {
          final jd = widget.jogadores[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
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
                    // width: MediaQuery.of(context).size.width * 0.3,
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
            ),
          );
        },
      ),
    );
  }
}
