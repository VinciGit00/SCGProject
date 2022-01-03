import 'package:flutter/material.dart';
import 'package:frontendscg/database/constants.dart';

class ListBuilder extends StatelessWidget {
  ListBuilder(this.listaItem, this.nomeColonna, {Key? key}) : super(key: key);

  final List<List<String>> listaItem;
  final String nomeColonna;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: ColorData().blocchiPagina),
          borderRadius: BorderRadius.circular(8),
          color: ColorData().sfondoPagina,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Titolo Colonna
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  nomeColonna,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),

            // Elementi Colonna
            Expanded(
              flex: 7,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: listaItem.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: ColorData().blocchiPagina,
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(3),
                        leading: Text(index.toString()),
                        title: Text(listaItem[index][1]),
                        trailing: Text(listaItem[index][0]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
