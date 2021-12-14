import asyncio
import json

# Classe da chiamare esternamente per recuperare i dati
class Datascript :
    async def getData():
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
    scostamentoMol = 0
    molBudget = 0
    molConsuntivo = 0 

    # RICAVI
    scostamentoRicavi = 0
    ricaviBudget = 0
    ricaviConsuntivo = 0
    
    # COSTI
    scostamentoCosti = 0
    costiBudget = 0
    costiConsuntivo = 0
    
    # Metodo che contiene lo script da eseguire 
    async def scr(self):
        print("inizio esecuzione script...")
        self.scostamentoMol = 7738
        await asyncio.sleep(5)
        self.scostamentoRicavi = 381781
        print("fine esecuzione script...")
        return 


    # Metodo per trasformare una classe in un json
    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, 
            sort_keys=True, indent=4)


if __name__ ==  "__main__":
    main()




