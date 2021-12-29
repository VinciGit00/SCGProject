# %%capture
# !pip install -U pandasql
import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns
import altair as alt
import os.path
import getpass
import platform
import asyncio


class FixDatas:
    async def runFixDatas():

        # Creazione path per caricamento dei raw datasets dalla folder Datasets/RawDatasets
        username = getpass.getuser()
        pathPart1 = "/Users/"
        pathPart2 = "/Github/SCGProject/Datasets"

        # MACOS 
        if platform.system() == "Darwin":
            complePath = pathPart1+username+pathPart2
            print("The OS is MACOS")
            print("Complete path: ", complePath)
            dload = os.chdir(complePath)
        
        # LINUX
        elif platform.system() == "Linux":
            complePath = pathPart1+username+pathPart2
            print("The OS is Linux")
            print("Complete path: ", complePath)
            dload = os.chdir(complePath)

        # WINDOWS
        else:
            complePath = "C:\SCGProject\Datasets"
            print("The OS is Windows")
            print("Complete path: ", complePath)
            dload = os.chdir(complePath)


        dfClienti = pd.read_excel('RawDatasets/Clienti.xlsx')

        dfClienti = dfClienti.rename(
            columns={'Nr.': 'Nr', 'Cod. condizioni pagam.': 'CodCondizioniPagam', 'Fatt. cumulative': 'FattCumulative'})


        #1: Euro
        indice1 = dfClienti.loc[dfClienti.Valuta == 1, :]

        indice1.insert(loc=4, column='Valuta',
                    value='Euro', allow_duplicates=True)

        #2: Dollaro
        indice2 = dfClienti.loc[dfClienti.Valuta == 2, :]

        indice2.insert(loc=4, column='Valuta',
                    value='Dollaro', allow_duplicates=True)

        #3: Yen
        indice3 = dfClienti.loc[dfClienti.Valuta == 3, :]

        indice3.insert(loc=4, column='Valuta',
                    value='Dollaro', allow_duplicates=True)

        #Unione delle sottotabelle
        union = pd.concat([indice1, indice2, indice3])

        union = union.rename(
            columns={'Nr.': 'Nr', 'Cod. condizioni pagam.': 'CodCondizioniPagam', 'Fatt. cumulative': 'FattCumulative'})

        dfConsumi = pd.read_excel('RawDatasets/Consumi.xlsx')

        del dfConsumi["Tipo movimento"]
        del dfConsumi["Tipo origine"]

        dfConsumi = dfConsumi.rename(
            columns={'Nr. movimento': "NrMovimento", 'Codice MP': 'CodiceMP', 'Nr articolo': 'NrArticolo', 'Nr. documento': 'NrDocumento',
                    'Quantità MP impiegata': 'QuantityMPImpiegata', 'Importo costo (TOTALE)': 'ImportoCostoTOTALE'})

        dfCostoOrario = pd.read_excel('RawDatasets/Costo orario risorse - budget.xlsx')

        dfCostoOrario = pd.read_excel('RawDatasets/Costo orario risorse - budget.xlsx')
        dfCostoOrario = dfCostoOrario.rename(
            columns={'Area di produzione': 'AreaProduzione', 'Costo orario (€/h)': 'CostoOrario'})

        dfConsuntivo = pd.read_excel(
            'RawDatasets/Costo orario risorse - consuntivo.xlsx')

        dfConsuntivo = dfConsuntivo.rename(
            columns={'Area di produzione': 'AreaProduzione', 'Costo orario (€/h)': 'CostoOrario'})

        dfImpiegoRisorse = pd.read_excel('RawDatasets/Impiego orario risorse.xlsx')

        dfImpiegoRisorse = dfImpiegoRisorse.rename(
            columns={'nr articolo': 'NrArticolo', 'budget/consuntivo': 'budgetConsuntivo', 'Nr. Ordine di produzione': 'NrOrdineProduzione', 'Nr. Area di produzione': 'NrAreaProduzione',
                    'Tempo risorsa': 'TempoRisorsa', 'Quantità di output': 'QuantitydiOutput'})

        dfCambio = pd.read_excel('RawDatasets/Tassi di cambio.xlsx')

        dfCambio = dfCambio.rename(columns={
                                'Codice valuta': 'CodiceValuta', 'Tasso di cambio medio': 'TassoCambioMedio'})
        #1: Euro
        indice1 = dfCambio.loc[dfCambio.CodiceValuta == 1, :]

        #2: Dollaro
        indice2 = dfCambio.loc[dfCambio.CodiceValuta == 2, :]

        #3: Yen
        indice3 = dfCambio.loc[dfCambio.CodiceValuta == 3, :]

        #Unione delle sottotabelle
        union = pd.concat([indice1, indice2, indice3])

        dfVendite = pd.read_excel('RawDatasets/Vendite.xlsx')

        del dfVendite["Tipo movimento"]
        del dfVendite["Tipo origine"]

        dfVendite = dfVendite.rename(
            columns={'Nr. movimento': 'NrMovimento', 'budget/cons': 'budget/cons', 'Nr articolo': 'NrArticolo',
                    'Nr. origine': 'NrOrigine', 'Quantità': 'Quantity', 'Importo vendita in valuta locale (TOTALE VENDITA)': 'ImportoVenditaValutaLocaleTOTALEVENDITA'})


        # Creazione nuovo path per il caricamento dei dataset in Datasets/CorrectedDatasets
        username = getpass.getuser()

        print("Username: ", username)
        pathPart1 = "/Users/"
        pathPart2New = "/Github/SCGProject/Datasets/CorrectedDatasets"

        # MACOS
        if platform.system() == "Darwin":
            print("The OS is MACOS")
            print("Complete path: ", complePath)
            complePath = pathPart1+username+pathPart2New

        # LINUX
        elif platform.system() == "Linux":
            print("The OS is Linux")
            print("Complete path: ", complePath)
            complePath = pathPart1+username+pathPart2New
        
        # WINDOWS
        else:
            complePath= "C:\SCGProject\Datasets\CorrectedDatasets"
            print("The OS is Windows")
            print("Complete path: ", complePath)

        dload = os.chdir(complePath)
            

        # Caricamento dei dataset corretti nel file system
        dfClienti.to_csv('dfClienti.csv')
        dfConsumi.to_csv('dfConsumi.csv')
        dfCostoOrario.to_csv('dfCostoOrario.csv')
        dfCambio.to_csv('dfCambio.csv')
        union.to_csv('dftuttiClienti.csv')
        dfVendite.to_csv('dfVendite.csv')
        dfImpiegoRisorse.to_csv('dfImpiegoRisorse.csv')
        dfConsuntivo.to_csv('dfConsuntivo.csv')
        return "OK"
