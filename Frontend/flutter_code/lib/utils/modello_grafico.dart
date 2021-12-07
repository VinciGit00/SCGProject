import 'package:frontendscg/utils/graph_names.dart';

class ModelloGrafico {
  ModelloGrafico(
      {required this.indexX, required this.indexY, required this.nomeGrafico});

  // Quale colonna della tabella mostrare come dati sulla Y
  final int indexY;
  // Quale colonna della tabella mostrare come dati sulla X
  final int indexX;

  // Nome della tabella da mostrare
  final String nomeGrafico;
}
