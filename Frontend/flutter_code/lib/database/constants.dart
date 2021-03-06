import 'package:flutter/material.dart';

enum Names {
  //MOL
  molBudget,
  molScostamentoVol,
  molMixStandard,
  molScostamentoMix,
  molMixEffettivo,
  molScostamentoPrezzo,
  molMixValuta,
  molScostamentoValuta,
  molConsuntivo,
  molScostamentoTot,

  //RICAVI
  ricaviBudget,
  ricaviScostamentoVol,
  ricaviMixStandard,
  ricaviScostamentoMix,
  ricaviMixEffettivo,
  ricaviScostamentoPrezzo,
  ricaviMixValuta,
  ricaviScostamentoValuta,
  ricaviConsuntivo,
  ricaviScostamentoTot,

  //MATERIE PRIME
  materiePrimeBudget,
  materiePrimeScostamentoVol,
  materiePrimeMixStandard,
  materiePrimeScostamentoMix,
  materiePrimeMixEffettivo,
  materiePrimeScostamentoPrezzo,
  materiePrimeMixValuta,
  materiePrimeScostamentoValuta,
  materiePrimeConsuntivo,
  materiePrimeScostamentoTot,

  //LAVORAZIONI INTERNE
  lavorazioniInterneBudget,
  lavorazioniInterneScostamentoVol,
  lavorazioniInterneMixStandard,
  lavorazioniInterneScostamentoMix,
  lavorazioniInterneMixEffettivo,
  lavorazioniInterneScostamentoPrezzo,
  lavorazioniInterneMixValuta,
  lavorazioniInterneScostamentoValuta,
  lavorazioniInterneConsuntivo,
  lavorazioniInterneScostamentoTot,

  //COSTI TOTALI
  costiTotaliBudget,
  costiTotaliScostamentoVol,
  costiTotaliMixStandard,
  costiTotaliScostamentoMix,
  costiTotaliMixEffettivo,
  costiTotaliScostamentoPrezzo,
  costiTotaliMixValuta,
  costiTotaliScostamentoValuta,
  costiTotaliConsuntivo,
  costiTotaliScostamentoTot,
}

class ColorData {
  Color sfondoPagina = Colors.grey[300]!;
  Color blocchiPagina = Colors.white;
  Color pulsanti = const Color(0xFF1C4E80);
  Color colonnaChart = const Color(0xFF0091D5);
}
