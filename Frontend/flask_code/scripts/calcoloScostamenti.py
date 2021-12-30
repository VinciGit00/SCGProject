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
import asyncio


class CalcoloScostamenti:
    async def runCalcoloScostamenti():
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
        # Ricavi
        dfVendite.rename(columns={'budget/cons': 'budget'}, inplace=True)
        venditeConsuntivo = sqldf(
            "SELECT DISTINCT * FROM dfVendite WHERE budget = 'CONSUNTIVO' or budget = 'Consuntivo'")
        venditeBudget = sqldf(
            "SELECT DISTINCT * FROM dfVendite WHERE budget = 'BUDGET' or budget = 'Budget'")

        # join with dfCambio and dfClienti
        venditeConsuntivo = sqldf('''SELECT DISTINCT v.NrMovimento, v.budget, v.NrArticolo, v.Quantity, v.ImportoVenditaValutaLocaleTOTALEVENDITA,k.TassoCambioMedio,v.ImportoVenditaValutaLocaleTOTALEVENDITA/k.TassoCambioMedio as TotaleEuro, v.NrOrigine, c.CodCondizioniPagam, c.FattCumulative, c.Valuta
            FROM venditeConsuntivo as v join dfClienti as c on v.NrOrigine = c.Nr join dfCambio as k on c.Valuta = k.CodiceValuta
            where k.Anno = 'Consuntivo' or k.Anno = 'CONSUNTIVO' ''')

        venditeBudget = sqldf('''SELECT DISTINCT v.NrMovimento, v.budget, v.NrArticolo, v.Quantity, v.ImportoVenditaValutaLocaleTOTALEVENDITA,k.TassoCambioMedio,v.ImportoVenditaValutaLocaleTOTALEVENDITA/k.TassoCambioMedio as TotaleEuro, v.NrOrigine, c.CodCondizioniPagam, c.FattCumulative, c.Valuta
            FROM venditeBudget as v join dfClienti as c on v.NrOrigine = c.Nr join dfCambio as k on c.Valuta = k.CodiceValuta
            where k.Anno = 'Budget' or k.Anno = 'BUDGET' ''')

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
        impiegoConsuntivoOld = sqldf('''select NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,sum(TempoRisorsa) as TempoRisorsa,CostoOrario, sum(QuantitydiOutput) as QuantitydiOutput
            from impiegoConsuntivo
            group by NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,CostoOrario
            order by NrArticolo
            ''')
        impiegoConsuntivo1 = impiegoConsuntivoOld.copy()

        impiegoConsuntivoNew = sqldf('''select NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,sum(TempoRisorsa) as TempoRisorsa,CostoOrario, max(QuantitydiOutput) as QuantitydiOutput
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
        impiegoBudgetOld = sqldf('''select NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,sum(TempoRisorsa) as TempoRisorsa,CostoOrario, sum(QuantitydiOutput) as QuantitydiOutput
            from impiegoBudget
            group by NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,CostoOrario
            order by NrArticolo
            ''')
        
        impiegoBudget1 = impiegoBudgetOld.copy()

        impiegoBudgetNew = sqldf('''select NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,sum(TempoRisorsa) as TempoRisorsa,CostoOrario, max(QuantitydiOutput) as QuantitydiOutput
            from impiegoBudget
            group by NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,CostoOrario
            order by NrArticolo
        ''')


        impiegoBudgetNew = sqldf('''select NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,sum(TempoRisorsa) as TempoRisorsa,CostoOrario, sum(QuantitydiOutput) as QuantitydiOutput
            from impiegoBudgetNew
            group by NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,CostoOrario
            order by NrArticolo
        ''')

        sumImpiegoConsuntivo = sqldf(
            'SELECT sum(TempoRisorsa*CostoOrario) FROM impiegoConsuntivoNew WHERE TempoRisorsa>=0')


        sumImpiegoBudget = sqldf(
            'SELECT sum(TempoRisorsa*CostoOrario) FROM impiegoBudgetNew WHERE TempoRisorsa>=0')


        # Creazione colonna ImpiegoUnitario
        impiegoConsuntivoNew = sqldf(''' select NrArticolo, budgetConsuntivo, NrOrdineProduzione, Descrizione, NrAreaProduzione, Risorsa, TempoRisorsa, TempoRisorsa/QuantitydiOutput as ImpiegoUnitario, CostoOrario ,QuantitydiOutput
            from impiegoConsuntivoNew''')


        impiegoConsuntivoNew = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, sum(TempoRisorsa) as TempoRisorsa, avg(CostoOrario) as CostoOrario, max(QuantitydiOutput) as QuantitydiOutput
            from impiegoConsuntivoNew
            group by NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione
            ''')

        impiegoConsuntivo = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, TempoRisorsa, (TempoRisorsa/QuantitydiOutput) as ImpiegoUnitario, CostoOrario,QuantitydiOutput
            from impiegoConsuntivoNew
            order by NrArticolo
            ''')

        impiegoBudgetNew = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, sum(TempoRisorsa) as TempoRisorsa, avg(CostoOrario) as CostoOrario, max(QuantitydiOutput) as QuantitydiOutput
            from impiegoBudgetNew
            group by NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione
            ''')


        impiegoBudget = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, TempoRisorsa, (TempoRisorsa/QuantitydiOutput) as ImpiegoUnitario, CostoOrario,QuantitydiOutput
            from impiegoBudgetNew
            order by NrArticolo
            ''')

        impiegoConsuntivo.drop(['budgetConsuntivo'], axis=1, inplace=True)


        impiegoBudget.drop(['budgetConsuntivo'], axis=1, inplace=True)
        x = pd.merge(impiegoConsuntivo, impiegoBudget, on=[
             'NrArticolo', 'Descrizione', 'NrAreaProduzione'], how='outer')

        c = sqldf(
            'select sum(ImpiegoUnitario_x*CostoOrario_x*QuantitydiOutput_x) from x').iloc[0][0]


        b = sqldf(
         'select sum(ImpiegoUnitario_y*CostoOrario_y*QuantitydiOutput_y) from x').iloc[0][0]


        #Budget Standard
        BudgetStandardLav = sqldf(
             'select sum(ImpiegoUnitario_y*CostoOrario_y*QuantitydiOutput_y) from x').iloc[0][0]
        # Impiego Standard (volume a consuntivo)
        ImpiegoStandardLav = sqldf(
            'select sum(ImpiegoUnitario_y*CostoOrario_y*QuantitydiOutput_x) from x').iloc[0][0]
        # Impiego Effettivo (volume e impiego a consuntivo)
        ImpiegoEffettivoLav = sqldf(
            'select sum(ImpiegoUnitario_x*CostoOrario_y*QuantitydiOutput_x) from x').iloc[0][0]
        # Budget Effettivo (tutto a consuntivo)
        BudgetEffettivoLav = sqldf(
            'select sum(ImpiegoUnitario_x*CostoOrario_x*QuantitydiOutput_x) from x').iloc[0][0]


        #Scostamenti
        ScostamentoVolumeLav = ImpiegoStandardLav-b
        ScostamentoImpiegoLav = ImpiegoEffettivoLav-ImpiegoStandardLav
        ScostamentoPrezzoLav = BudgetEffettivoLav-ImpiegoEffettivoLav

        consumiConsuntivoUnitByMP = sqldf('''select CodiceMP, NrArticolo, NrDocumento as NrOrdineProduzione, sum(QuantityMPImpiegata) as QuantityMPImpiegata, sum(ImportoCostoTOTALE) as ImportoCostoTOTALE
            from consumiConsuntivo     
            group by CodiceMP, NrArticolo, NrOrdineProduzione''')


        consumiBudgetUnitByMP = sqldf('''select CodiceMP, NrArticolo,NrDocumento as NrOrdineProduzione, sum(QuantityMPImpiegata) as QuantityMPImpiegata, sum(ImportoCostoTOTALE) as ImportoCostoTOTALE
            from consumiBudget     
            group by CodiceMP, NrArticolo,NrOrdineProduzione''')
        
        temp = sqldf('''select a.CodiceMP,a.NrArticolo,a.NrOrdineProduzione,a.QuantityMPImpiegata,a.ImportoCostoTOTALE,
            (select max(QuantitydiOutput) from impiegoConsuntivoNew  where a.NrArticolo = NrArticolo and a.NrOrdineProduzione = NrOrdineProduzione) as QuantitydiOutput
            from consumiConsuntivoUnitByMP as a''')


        temp = sqldf('''select distinct CodiceMP,NrArticolo,sum(QuantityMPImpiegata) as QuantityMPImpiegata,sum(ImportoCostoTOTALE) as ImportoCostoTOTALE ,QuantitydiOutput 
            from temp group by CodiceMP,NrArticolo''')
        consumiConsuntivoVolProd = sqldf('''select distinct CodiceMP,NrArticolo,QuantityMPImpiegata,QuantitydiOutput,(ImportoCostoTOTALE/QuantityMPImpiegata)/QuantitydiOutput as CostoUnitario, ImportoCostoTOTALE
            from temp group by CodiceMP,NrArticolo''')

        temp = sqldf('''select a.CodiceMP,a.NrArticolo,a.NrOrdineProduzione,a.QuantityMPImpiegata,a.ImportoCostoTOTALE,             (select max(QuantitydiOutput) from impiegoBudgetNew  where a.NrArticolo = NrArticolo and a.NrOrdineProduzione = NrOrdineProduzione) as QuantitydiOutput
            from consumiBudgetUnitByMP as a''')
        temp = sqldf('''select distinct CodiceMP,NrArticolo,sum(QuantityMPImpiegata) as QuantityMPImpiegata,sum(ImportoCostoTOTALE) as ImportoCostoTOTALE ,QuantitydiOutput 
            from temp group by CodiceMP,NrArticolo''')
        consumiBudgetVolProd = sqldf('''select distinct CodiceMP,NrArticolo,QuantityMPImpiegata,QuantitydiOutput,(ImportoCostoTOTALE/QuantityMPImpiegata)/QuantitydiOutput as CostoUnitario, ImportoCostoTOTALE
            from temp group by CodiceMP,NrArticolo''')
        
        ConsumiUnit = pd.merge(consumiConsuntivoVolProd, consumiBudgetVolProd, on=[
                               'CodiceMP', 'NrArticolo'], how='outer')
        BudgetEffettivoMP = sqldf(
            'select sum(QuantitydiOutput_x*QuantityMPImpiegata_x*CostoUnitario_x) from ConsumiUnit').iloc[0][0]


        ImpiegoEffettivoMP = sqldf(
            'select sum(QuantitydiOutput_x*QuantityMPImpiegata_x*CostoUnitario_y) from ConsumiUnit').iloc[0][0]
        ImpiegoStandardMP = sqldf(
            'select sum(QuantitydiOutput_x*QuantityMPImpiegata_y*CostoUnitario_y) from ConsumiUnit').iloc[0][0]
        BudgetStandardMP = sqldf(
            'select sum(QuantitydiOutput_y*QuantityMPImpiegata_y*CostoUnitario_y) from ConsumiUnit').iloc[0][0]
        ScostamentoVolumeMP = ImpiegoStandardMP - BudgetStandardMP
        ScostamentoImpiegoMP = ImpiegoEffettivoMP-ImpiegoStandardMP
        ScostamentoPrezzoMP = BudgetEffettivoMP-ImpiegoEffettivoMP
        
        venditeConsuntivoArt = sqldf('''select NrArticolo, sum(Quantity) as Quantity, sum(TotaleEuro) as TotaleEuro
            from venditeConsuntivo
            group by NrArticolo''')

        venditeBudgetArt = sqldf('''select NrArticolo, sum(Quantity) as Quantity, sum(TotaleEuro) as TotaleEuro
            from venditeBudget
            group by NrArticolo''')


        vendite = pd.merge(venditeConsuntivoArt, venditeBudgetArt,
                       on=['NrArticolo'], how='outer')


        venditeBudgetS = sqldf('''select NrArticolo, (Quantity*100000000000/7224) as Mix, 7224 as VolumeTotale, TotaleEuro/Quantity as PrezzoUnitario
            from venditeBudgetArt''')

        venditeConsuntivoS = sqldf('''select NrArticolo, (Quantity*100000000000/9329) as Mix, 9329 as VolumeTotale, TotaleEuro/Quantity as PrezzoUnitario
        from venditeConsuntivoArt''')

        venditeS = pd.merge(venditeConsuntivoS, venditeBudgetS, on=[
                            'NrArticolo'], how='outer')


        BudgetStandardRic = sqldf(
            'select sum(Mix_y*VolumeTotale_y*PrezzoUnitario_y)/100000000000 from venditeS ').iloc[0][0]
        MixStandardRic = sqldf(
            'select sum(Mix_y*VolumeTotale_x*PrezzoUnitario_y)/100000000000 from venditeS ').iloc[0][0]
        MixEffettivoRic = sqldf(
            'select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_y)/100000000000 from venditeS ').iloc[0][0]
        BudgetEffettivoRic = sqldf(
            'select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_x)/100000000000 from venditeS ').iloc[0][0]
        
        return "OK"


