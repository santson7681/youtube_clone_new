import 'package:flutter/material.dart';
import 'CustomSearchDelegate.dart';
import 'telas/Biblioteca.dart';
import 'telas/EmAlta.dart';
import 'telas/Inicio.dart';
import 'telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              String? res = await showSearch<String>(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              setState(() {
                _resultado = res ?? "";
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
