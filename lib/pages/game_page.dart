import 'package:flutter/material.dart';
import 'package:jogo_fodase/components/jogadores_list_classificacao.dart';

import '../components/jogadores_list.dart';
import '../main.dart';
import '../models/jogadores.dart';
import '../pages/final_page.dart';

class GamePage extends StatefulWidget {
  List<Jogador> jogadores;

  GamePage({super.key, required this.jogadores});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int rodada = 1;

  _novaRodada() {
    setState(() {
      rodada += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Foda-se'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  'Rodada ${rodada.toString()}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                itemCount: widget.jogadores.length,
                itemBuilder: (ctx, index) {
                  final jd = widget.jogadores[index];
                  return JogadoresList(widget.jogadores);
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(width: 2, color: Colors.amber),
                    ),
                    child: Text(
                      'Nova Rodada',
                      style: TextStyle(color: Colors.amber),
                    ),
                    onPressed: () => _novaRodada()),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(width: 2, color: Colors.amber),
                      ),
                      child: Text(
                        'Encerrar',
                        style: TextStyle(color: Colors.amber),
                      ),
                      onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(width: 2, color: Colors.amber),
                      ),
                      child: Text(
                        'Classificação',
                        style: TextStyle(color: Colors.amber),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            scrollable: true,
                            title: Center(
                              child: Text('Classificação Parcial'),
                            ),
                            content: Container(
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height * 0.77,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: widget.jogadores.length,
                                itemBuilder: (ctx, index) {
                                  final jd = widget.jogadores[index];
                                  return JogadoresListClassificacao(
                                      widget.jogadores);
                                },
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.amber),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
