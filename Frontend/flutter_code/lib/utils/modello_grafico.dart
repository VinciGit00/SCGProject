// INFORMAZIONI ASSOCIATE AD OGNI SINGOLO GRAFICO

class ModelloGrafico {
  ModelloGrafico(
      {required this.indexX,
      required this.indexY1,
      this.indexY2,
      this.indexY3,
      required this.nomeGrafico});

  // Quale/i colonna della tabella mostrare come dati sulla Y
  // Max 3 righe sullo stesso grafico
  // Una linea è obbligatoria, le altre due sono opzionali
  final int indexY1;
  final int? indexY2;
  final int? indexY3;

  // Quale colonna della tabella mostrare come dati sulla X
  final int indexX;

  // Nome della tabella da mostrare
  final String nomeGrafico;
}
