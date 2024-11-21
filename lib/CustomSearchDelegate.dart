import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ""); // Use uma string vazia em vez de null
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print("resultado: a pesquisa realizada");
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> lista = [];

    if (query.isNotEmpty) {
      lista = ["android", "android navegação"].where(
              (texto) => texto.startsWith(query)
      ).toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lista[index]),
            onTap: () {
              close(context, lista[index]);
            },
          );
        },
      );
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }
  }
}
