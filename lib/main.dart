import 'package:flutter/material.dart';
import 'package:jogo_fodase/components/jogadores_form.dart';
import 'package:jogo_fodase/pages/game_page.dart';
import 'components/jogadores_list.dart';
import 'models/jogadores.dart';

main() => runApp(const DaneseApp());

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
  final List<Jogador> _jogadores = [
    Jogador(
      nome: 'Gabriel',
    ),
    Jogador(
      nome: 'Kleyte',
    ),
    Jogador(
      nome: 'Belinha',
    ),
    Jogador(
      nome: 'Val',
    ),
    Jogador(
      nome: 'Pedro',
    ),
  ];

  _addJogador(String nome) {
    final newJogador = Jogador(nome: nome);

    // adcionando o novo jogador pelo componente statefull
    setState(() {
      _jogadores.add(newJogador);
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
            'Jogo Dane-se',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            JogadoresList(_jogadores),
            Row(
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
                      builder: (context) => GamePage(jogadores: _jogadores),
                    ),
                  ),
                  child: Text(
                    'Jogar',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _openJogadorFormModal(context),
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
