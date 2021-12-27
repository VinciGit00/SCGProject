import asyncio
import json
from scripts import datasetFormatting as df

# Classe da chiamare esternamente per recuperare i dati
class Datascript :
    async def getData():

        # Formatto i Dataset
        #print("inizio formattazione dataset...")
        #a = df.DatasetFormatting()
        #await a.formatDatasets()
        #print("fine formattazione dataset")

        # Creo istanza classe        
        d = Data()
        # Eseguo lo script
        await d.scr()
        # Ritorno dati prodotti dallo script in formato json
        return d.toJSON()


# Classe che esegue lo script e associa ai suoi campi i valori generati
# TODO: dichiarare le variabili a cui si vuole poi assegnare un valore. 
# TODO: eseguire lo script dentro il metodo scr()

class Data:
    # MARGINE OPERATIVO LORDO
    molScostamento = 0
    molBudget = 0
    molConsuntivo = 0 

    # RICAVI
    ricaviScostamento = 0
    ricaviBudget = 0
    ricaviConsuntivo = 0
    ricaviScostamentoVolume = 0
    ricaviScostamentoMix = 0
    ricaviScostamentoTassoCambio = 0
    ricaviMixStandard = 0
    ricaviMixConsuntivo = 0
    ricaviTassoCambioConsuntivo = 0
    
    # COSTI
    costiScostamento = 0
    costiBudget = 0
    costiConsuntivo = 0

    # MATERIE PRIME
    materiePrimeScostamento = 0
    materiePrimeBudget = 0
    materiePrimeConsuntivo = 0

    # LAVORAZIONI INTERNE
    lavorazioniInterneScostamento = 0
    lavorazioniInterneBudget = 0
    lavorazioniInterneConsuntivo = 0
   
    # Metodo che contiene lo script da eseguire 
    async def scr(self):
        print("inizio esecuzione script...")

        self.molScostamento = 100092
        self.molBudget = 188827
        self.molConsuntivo = 1888200        

        self.ricaviScostamento = 1873378 
        self.ricaviBudget = 776276
        self.ricaviConsuntivo = 199999
        self.ricaviScostamentoVolume = 19999
        self.ricaviScostamentoMix = 11199 
        self.ricaviScostamentoTassoCambio = 18800
        self.ricaviMixStandard = 11999
        self.ricaviMixConsuntivo = 3129 
        self.ricaviTassoCambioConsuntivo = 1929


        self.costiScostamento = 1000000
        self.costiBudget = 1000011
        self.costiConsuntivo = 999199

        self.materiePrimeScostamento = 767273
        self.materiePrimeBudget = 718278 
        self.materiePrimeConsuntivo = 1888829

        self.lavorazioniInterneScostamento = 1000000 
        self.lavorazioniInterneBudget = 500190 
        self.lavorazioniInterneConsuntivo = 1872889 

        print("fine esecuzione script...")
        return 

    # Metodo per trasformare una classe in un json
    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, 
            sort_keys=True, indent=4)


if __name__ ==  "__main__":
    main()




