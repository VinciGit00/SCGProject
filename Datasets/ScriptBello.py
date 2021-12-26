import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns
import altair as alt
import os.path
import getpass
import platform
from pandasql import sqldf
import openpyxl

def runScriptBello():
    import numpy as np


username = getpass.getuser()

pathPart1 = "/Users/"
pathPart2 = "/Github/SCGProject/Datasets/"
complePath = pathPart1+username+pathPart2

if platform.system() == "Darwin":
    if(username == "marcovinciguerra"):
        dfCambio = pd.read_csv(
            complePath+"/CorrectedDatasets/dfCambio.csv")

        dfClienti = pd.read_csv(
            complePath+"/CorrectedDatasets/dfClienti.csv")

        dfConsumi = pd.read_csv(
            complePath + "/CorrectedDatasets/dfConsumi.csv")

        dfCostoOrarioConsuntivo = pd.read_csv(
            complePath+"/CorrectedDatasets/dfConsuntivo.csv")

        dfCostoOrarioBudget = pd.read_csv(
            complePath+"CorrectedDatasets/dfCostoOrario.csv")

        dfImpiegoRisorse = pd.read_csv(
            complePath+"/CorrectedDatasets/dfImpiegoRisorse.csv")

        dftuttiClienti = pd.read_csv(
            complePath+"/CorrectedDatasets/dftuttiClienti.csv")

        dfVendite = pd.read_csv(
            complePath+"/CorrectedDatasets/dfVendite.csv")

    elif(username == "davidguzman"):
        pathPart1 = "/Users/"
        pathPart2 = "/documents/Github/SCGProject/Datasets/"
        complePath = pathPart1+username+pathPart2

        dfCambio = pd.read_csv(
            complePath+"/CorrectedDatasets/dfCambio.csv")

        dfClienti = pd.read_csv(
            complePath+"/CorrectedDatasets/dfClienti.csv")

        dfConsumi = pd.read_csv(
            complePath + "/CorrectedDatasets/dfConsumi.csv")

        dfCostoOrarioConsuntivo = pd.read_csv(
            complePath+"/CorrectedDatasets/dfConsuntivo.csv")

        dfCostoOrarioBudget = pd.read_csv(
            complePath+"CorrectedDatasets/dfCostoOrario.csv")

        dfImpiegoRisorse = pd.read_csv(
            complePath+"/CorrectedDatasets/dfImpiegoRisorse.csv")

        dftuttiClienti = pd.read_csv(
            complePath+"/CorrectedDatasets/dftuttiClienti.csv")

        dfVendite = pd.read_csv(
            complePath+"/CorrectedDatasets/dfVendite.csv")

    elif platform.system() == "Linux":
        complePath = "/home/alinux/unibg/git_repo/SCGProject"
        pathPart1 = "/Users/"
        pathPart2 = "/documents/Github/SCGProject/Datasets/"
        complePath = pathPart1+username+pathPart2

        dfCambio = pd.read_csv(
            complePath+"/CorrectedDatasets/dfCambio.csv")

        dfClienti = pd.read_csv(
            complePath+"/CorrectedDatasets/dfClienti.csv")

        dfConsumi = pd.read_csv(
            complePath + "/CorrectedDatasets/dfConsumi.csv")

        dfCostoOrarioConsuntivo = pd.read_csv(
            complePath+"/CorrectedDatasets/dfConsuntivo.csv")

        dfCostoOrarioBudget = pd.read_csv(
            complePath+"CorrectedDatasets/dfCostoOrario.csv")

        dfImpiegoRisorse = pd.read_csv(
            complePath+"/CorrectedDatasets/dfImpiegoRisorse.csv")

        dftuttiClienti = pd.read_csv(
            complePath+"/CorrectedDatasets/dftuttiClienti.csv")

        dfVendite = pd.read_csv(
            complePath+"/CorrectedDatasets/dfVendite.csv")


    dfCambio["TassoCambioMedio"] = dfCambio["TassoCambioMedio"].str.replace(
        ',', '.')

    dfVendite.rename(columns = {'budget/cons':'budget'}, inplace = True)
    venditeConsuntivo = sqldf("SELECT DISTINCT * FROM dfVendite WHERE budget = 'CONSUNTIVO' or budget = 'Consuntivo'")
    venditeBudget = sqldf("SELECT DISTINCT * FROM dfVendite WHERE budget = 'BUDGET' or budget = 'Budget'")

    # join with dfCambio and dfClienti
    venditeConsuntivo = sqldf('''SELECT DISTINCT v.NrMovimento, v.budget, v.NrArticolo, v.Quantity, v.ImportoVenditaValutaLocaleTOTALEVENDITA,k.TassoCambioMedio,v.ImportoVenditaValutaLocaleTOTALEVENDITA/k.TassoCambioMedio as TotaleEuro, v.NrOrigine, c.CodCondizioniPagam, c.FattCumulative, c.Valuta
    FROM venditeConsuntivo as v join dfClienti as c on v.NrOrigine = c.Nr join dfCambio as k on c.Valuta = k.CodiceValuta
    where k.Anno = 'Consuntivo' or k.Anno = 'CONSUNTIVO'
    ''')

    venditeBudget = sqldf('''SELECT DISTINCT v.NrMovimento, v.budget, v.NrArticolo, v.Quantity, v.ImportoVenditaValutaLocaleTOTALEVENDITA,k.TassoCambioMedio,v.ImportoVenditaValutaLocaleTOTALEVENDITA/k.TassoCambioMedio as TotaleEuro, v.NrOrigine, c.CodCondizioniPagam, c.FattCumulative, c.Valuta
    FROM venditeBudget as v join dfClienti as c on v.NrOrigine = c.Nr join dfCambio as k on c.Valuta = k.CodiceValuta
    where k.Anno = 'Budget' or k.Anno = 'BUDGET'
    ''')
    dfConsumi.rename(columns={'Budget/cons': 'budget'}, inplace=True)

    consumiConsuntivo = sqldf(
        "SELECT DISTINCT * FROM dfConsumi WHERE budget = 'CONSUNTIVO'")
    consumiBudget = sqldf(
        "SELECT DISTINCT * FROM dfConsumi WHERE budget = 'BUDGET'")
    sumConsumiConsuntivo = sqldf(
        'select sum(ImportoCostoTOTALE) from consumiConsuntivo')
    sumConsumiBudget = sqldf('select sum(ImportoCostoTOTALE) from consumiBudget')

    impiegoConsuntivo = sqldf(
        "SELECT DISTINCT * FROM dfImpiegoRisorse WHERE budgetConsuntivo = 'CONSUNTIVO' or budgetConsuntivo = 'Consuntivo'")
    #join con i costi orari
    impiegoConsuntivo = sqldf('''SELECT DISTINCT i.NrArticolo,i.budgetConsuntivo,i.NrOrdineProduzione,i.Descrizione,i.NrAreaProduzione,i.Risorsa,i.QuantitydiOutput,i.TempoRisorsa,c.CostoOrario
    FROM impiegoConsuntivo as i join dfCostoOrarioConsuntivo as c 
    on c.AreaProduzione = i.NrAreaProduzione and c.Risorsa = i.Risorsa''')
    # ci sono alcune quantità di output nulle, per gestire le sommiamo alle tuple con tutte le altre cose uguali
    impiegoConsuntivo = sqldf('''select NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,sum(TempoRisorsa) as TempoRisorsa,CostoOrario, sum(QuantitydiOutput) as QuantitydiOutput
    from impiegoConsuntivo
    group by NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,CostoOrario
    order by NrArticolo
    ''')

    impiegoBudget = sqldf(
        "SELECT DISTINCT * FROM dfImpiegoRisorse WHERE budgetConsuntivo = 'BUDGET' or budgetConsuntivo = 'Budget'")
    #join con i costi orari
    impiegoBudget = sqldf('''SELECT DISTINCT i.NrArticolo,i.budgetConsuntivo,i.NrOrdineProduzione,i.Descrizione,i.NrAreaProduzione,i.Risorsa,i.QuantitydiOutput,i.TempoRisorsa,c.CostoOrario
    FROM impiegoBudget as i join dfCostoOrarioBudget as c 
    on c.AreaProduzione = i.NrAreaProduzione and c.Risorsa = i.Risorsa''')
    # righe a consuntivo sono di più che a budget e la somma dei 2 non corrisponde al numero di righe della tabella impiego risorse

    # ci sono alcune quantità di output nulle, per gestire le sommiamo alle tuple con tutte le altre cose uguali
    impiegoBudget = sqldf('''select NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,sum(TempoRisorsa) as TempoRisorsa,CostoOrario, sum(QuantitydiOutput) as QuantitydiOutput
    from impiegoBudget
    group by NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,CostoOrario
    order by NrArticolo
    ''')
