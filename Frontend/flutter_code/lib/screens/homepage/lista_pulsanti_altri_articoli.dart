import 'package:flutter/material.dart';
import 'package:frontendscg/database/constants.dart';
import 'package:frontendscg/database/data_graph_builder.dart';
import 'package:frontendscg/widgets/pulsante_altri_scostamenti.dart';

// Lista dei pulsanti altri scostamenti presente nella homepage nel blocco destro

class ListaPulsantiAltriScostamenti extends StatelessWidget {
  const ListaPulsantiAltriScostamenti(this.data, {Key? key}) : super(key: key);

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // PULSANTI PER GLI ALTRI SCOSTAMENTI
        const Text(
          "Altri Scostamenti: ",
          style: TextStyle(fontSize: 35),
        ),

        // Ricavi
        PulsanteAltriScostamenti(
          graficoScostamentoData:
              DataGraphBuilder().ricaviScostamentoData(data),
          graficoBudgetConsuntivoData:
              DataGraphBuilder().ricaviBudgetConsuntivoData(data),
          dataPath: [
            Names.ricaviScostamentoTot.name,
            Names.ricaviBudget.name,
            Names.ricaviConsuntivo.name
          ],
          nomeScostamento: "Ricavi",
          valoreScostamento: data![Names.ricaviScostamentoTot.name]!,
          tabellaScostamenti: DataGraphBuilder().scostamentiColumnRicavi(data),
          tabellaValori: DataGraphBuilder().valoriColumnRicavi(data),
        ),

        //Materie Prime
        PulsanteAltriScostamenti(
          graficoScostamentoData:
              DataGraphBuilder().materiePrimeScostamentoData(data),
          graficoBudgetConsuntivoData:
              DataGraphBuilder().materiePrimeBudgetConsuntivoData(data),
          dataPath: [
            Names.materiePrimeScostamentoTot.name,
            Names.materiePrimeBudget.name,
            Names.materiePrimeConsuntivo.name
          ],
          nomeScostamento: "Materie Prime",
          valoreScostamento: data![Names.materiePrimeScostamentoTot.name]!,
          tabellaScostamenti:
              DataGraphBuilder().scostamentiColumnMateriePrime(data),
          tabellaValori: DataGraphBuilder().valoriColumnMateriePrime(data),
        ),

        // Lavorazioni Interne
        PulsanteAltriScostamenti(
          graficoScostamentoData:
              DataGraphBuilder().lavorazioniInterneScostamentoData(data),
          graficoBudgetConsuntivoData:
              DataGraphBuilder().lavorazioniInterneBudgetConsuntivoData(data),
          dataPath: [
            Names.lavorazioniInterneScostamentoTot.name,
            Names.lavorazioniInterneBudget.name,
            Names.lavorazioniInterneConsuntivo.name
          ],
          nomeScostamento: "Lavorazioni Interne",
          valoreScostamento:
              data![Names.lavorazioniInterneScostamentoTot.name]!,
          tabellaScostamenti:
              DataGraphBuilder().scostamentiColumnLavorazioniInterne(data),
          tabellaValori:
              DataGraphBuilder().valoriColumnLavorazioniInterne(data),
        ),

        // Costi Totali
        PulsanteAltriScostamenti(
          graficoScostamentoData:
              DataGraphBuilder().costiTotaliScostamentoData(data),
          graficoBudgetConsuntivoData:
              DataGraphBuilder().costiTotaliBudgetConsuntivoData(data),
          dataPath: [
            Names.costiTotaliScostamentoTot.name,
            Names.costiTotaliBudget.name,
            Names.costiTotaliConsuntivo.name
          ],
          nomeScostamento: "Costi Totali",
          valoreScostamento: data![Names.costiTotaliScostamentoTot.name]!,
          tabellaScostamenti:
              DataGraphBuilder().scostamentiColumnCostiTotali(data),
          tabellaValori: DataGraphBuilder().valoriColumnCostiTotali(data),
        ),
      ],
    );
  }
}
