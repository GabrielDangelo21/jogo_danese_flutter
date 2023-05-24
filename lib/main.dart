import 'package:flutter/material.dart';
import 'package:jogo_fodase/components/jogadores_form.dart';
import 'package:jogo_fodase/pages/game_page.dart';
import 'models/jogadores.dart';

main() => runApp(
      const DaneseApp(),
    );

class DaneseApp extends StatelessWidget {
  const DaneseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: ColorScheme.dark(),
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              toolbarTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                      titleLarge: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ))
                  .bodyMedium,
              titleTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                      titleLarge: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ))
                  .titleLarge)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Jogador> jogadores = [
  ];

  _addJogador(String nome) {
    final newJogador = Jogador(nome: nome);

    // adcionando o novo jogador pelo componente statefull
    setState(() {
      jogadores.add(newJogador);
    });
    // fechar o model do formulario após incluir novo jogador
    Navigator.of(context).pop();
  }

  _openJogadorFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return JogadoresForm(_addJogador);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Foda-se',
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
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
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(width: 2, color: Colors.amber),
                  ),
                  onPressed: () => _openJogadorFormModal(context),
                  child: Text(
                    'Adicionar jogador',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(width: 2, color: Colors.amber),
                  ),
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => GamePage(jogadores: jogadores),
                    ),
                  ),
                  child: Text(
                    'Jogar',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
