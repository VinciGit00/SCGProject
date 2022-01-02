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

class CalcoloScostamentiConIntermedi:
    # MOL
    molBudget = 0
    molScostamentoVol = 0
    molMixStandard = 0
    molScostamentoMix = 0
    molMixEffettivo = 0
    molScostamentoPrezzo = 0
    molMixValuta = 0
    molScostamentoValuta = 0
    molConsuntivo = 0
    molScostamentoTot = 0

    # RICAVI
    ricaviBudget = 0
    ricaviScostamentoVol = 0
    ricaviMixStandard = 0
    ricaviScostamentoMix = 0
    ricaviMixEffettivo = 0
    ricaviScostamentoPrezzo = 0
    ricaviMixValuta = 0
    ricaviScostamentoValuta = 0
    ricaviConsuntivo = 0
    ricaviScostamentoTot = 0


    # MATERIE PRIME
    materiePrimeBudget = 0
    materiePrimeScostamentoVol = 0
    materiePrimeMixStandard = 0
    materiePrimeScostamentoMix = 0
    materiePrimeMixEffettivo = 0
    materiePrimeScostamentoPrezzo = 0
    materiePrimeMixValuta = 0
    materiePrimeScostamentoValuta = 0
    materiePrimeConsuntivo = 0
    materiePrimeScostamentoTot = 0   

    # LAVORAZIONI INTERNE
    lavorazioniInterneiBudget = 0
    lavorazioniInterneScostamentoVol = 0
    lavorazioniInterneMixStandard = 0
    lavorazioniInterneScostamentoMix = 0
    lavorazioniInterneMixEffettivo = 0
    lavorazioniInterneScostamentoPrezzo = 0
    lavorazioniInterneMixValuta = 0
    lavorazioniInterneScostamentoValuta = 0
    lavorazioniInterneConsuntivo = 0
    lavorazioniInterneScostamentoTot = 0

    # COSTI TOTALI
    costiTotaliBudget = 0
    costiTotaliScostamentoVol = 0
    costiTotaliMixStandard = 0
    costiTotaliScostamentoMix = 0
    costiTotaliMixEffettivo = 0
    costiTotaliScostamentoPrezzo = 0
    costiTotaliMixValuta = 0
    costiTotaliScostamentoValuta = 0
    costiTotaliConsuntivo = 0
    costiTotaliScostamentoTot = 0   
   

    async def runCalcoloScostamenti():
        print("INIZIO ELABORAZIONE DATI...")
        username = getpass.getuser()

        #("Username: ", username)
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
            complePath = '/home/alinux/unibg/git_repo/SCGProject/Datasets/'

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

        else:
            complePath = "C:/SCGProject/Datasets/"
            
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


        dfCambio["TassoCambioMedio"] = dfCambio["TassoCambioMedio"].str.replace(',','.')

        print(dfClienti)

        # Ricavi
        dfVendite.rename(columns = {'budget/cons':'budget'}, inplace = True)
        venditeConsuntivo = sqldf("SELECT DISTINCT * FROM dfVendite WHERE budget = 'CONSUNTIVO' or budget = 'Consuntivo'")
        venditeBudget = sqldf("SELECT DISTINCT * FROM dfVendite WHERE budget = 'BUDGET' or budget = 'Budget'")


        #(venditeConsuntivo.shape, venditeBudget.shape)


        # join with dfCambio and dfClienti
        venditeConsuntivo = sqldf('''SELECT DISTINCT v.NrMovimento, v.budget, v.NrArticolo, v.Quantity, v.ImportoVenditaValutaLocaleTOTALEVENDITA,k.TassoCambioMedio,v.ImportoVenditaValutaLocaleTOTALEVENDITA/k.TassoCambioMedio as TotaleEuro, v.NrOrigine, c.CodCondizioniPagam, c.FattCumulative, c.Valuta
        FROM venditeConsuntivo as v join dfClienti as c on v.NrOrigine = c.Nr join dfCambio as k on c.Valuta = k.CodiceValuta
        where k.Anno = 'Consuntivo' or k.Anno = 'CONSUNTIVO'
        ''')

        venditeBudget = sqldf('''SELECT DISTINCT v.NrMovimento, v.budget, v.NrArticolo, v.Quantity, v.ImportoVenditaValutaLocaleTOTALEVENDITA,k.TassoCambioMedio,v.ImportoVenditaValutaLocaleTOTALEVENDITA/k.TassoCambioMedio as TotaleEuro, v.NrOrigine, c.CodCondizioniPagam, c.FattCumulative, c.Valuta
        FROM venditeBudget as v join dfClienti as c on v.NrOrigine = c.Nr join dfCambio as k on c.Valuta = k.CodiceValuta
        where k.Anno = 'Budget' or k.Anno = 'BUDGET'
        ''')




        #(venditeConsuntivo.shape, venditeBudget.shape)




        sumVenditeConsuntivo = sqldf('select sum(TotaleEuro) as sumVenditaTotale from venditeConsuntivo')
        sumVenditeBudget = sqldf('select sum(TotaleEuro) as sumVenditaTotale from venditeBudget')
        #(sumVenditeConsuntivo)
        #(sumVenditeBudget)
        #(sumVenditeConsuntivo-sumVenditeBudget) #questo è lo scostamento totale dei ricavi


        # # Costi

        # Materie prime



        dfConsumi.rename(columns = {'Budget/cons':'budget'}, inplace = True)
        consumiConsuntivo = sqldf("SELECT DISTINCT * FROM dfConsumi WHERE budget = 'CONSUNTIVO'")
        consumiBudget = sqldf("SELECT DISTINCT * FROM dfConsumi WHERE budget = 'BUDGET'")
        sumConsumiConsuntivo = sqldf('select sum(ImportoCostoTOTALE) from consumiConsuntivo')
        sumConsumiBudget = sqldf('select sum(ImportoCostoTOTALE) from consumiBudget')
        #(sumConsumiConsuntivo)
        #(sumConsumiBudget)
        #(sumConsumiConsuntivo-sumConsumiBudget) #questo è lo scostamento totale della materia prima


        # Lavorazioni interne



        impiegoConsuntivo = sqldf("SELECT DISTINCT * FROM dfImpiegoRisorse WHERE budgetConsuntivo = 'CONSUNTIVO' or budgetConsuntivo = 'Consuntivo'")
        #(impiegoConsuntivo.shape)
        #join con i costi orari
        impiegoConsuntivo  = sqldf('''SELECT DISTINCT i.NrArticolo,i.budgetConsuntivo,i.NrOrdineProduzione,i.Descrizione,i.NrAreaProduzione,i.Risorsa,i.QuantitydiOutput,i.TempoRisorsa,c.CostoOrario
        FROM impiegoConsuntivo as i join dfCostoOrarioConsuntivo as c 
        on c.AreaProduzione = i.NrAreaProduzione and c.Risorsa = i.Risorsa''')
        #(impiegoConsuntivo.shape)
        # ci sono alcune quantità di output nulle, per gestire le sommiamo alle tuple con tutte le altre cose uguali
        impiegoConsuntivoOld = sqldf('''select NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,sum(TempoRisorsa) as TempoRisorsa,CostoOrario, sum(QuantitydiOutput) as QuantitydiOutput
        from impiegoConsuntivo
        group by NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,CostoOrario
        order by NrArticolo
        ''')
        impiegoConsuntivo1 = impiegoConsuntivoOld.copy()
        # ASSUNZIONE: la quantity di output maggiore tiene conto di tutte quelle inferiori.




        impiegoConsuntivoNew = sqldf('''select NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,sum(TempoRisorsa) as TempoRisorsa,CostoOrario, max(QuantitydiOutput) as QuantitydiOutput
        from impiegoConsuntivo
        group by NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,CostoOrario
        order by NrArticolo
        ''')
        impiegoConsuntivoNew




        #(sqldf('select sum(QuantitydiOutput) from impiegoConsuntivoOld'))
        #(sqldf('select sum(QuantitydiOutput) from impiegoConsuntivoNew'))




        sqldf('select NrArticolo, NrOrdineProduzione, count(*) as c from impiegoConsuntivoNew group by NrArticolo, NrOrdineProduzione order by c')




        impiegoBudget = sqldf("SELECT DISTINCT * FROM dfImpiegoRisorse WHERE budgetConsuntivo = 'BUDGET' or budgetConsuntivo = 'Budget'")
        #join con i costi orari
        #(impiegoBudget.shape)
        impiegoBudget = sqldf('''SELECT DISTINCT i.NrArticolo,i.budgetConsuntivo,i.NrOrdineProduzione,i.Descrizione,i.NrAreaProduzione,i.Risorsa,i.QuantitydiOutput,i.TempoRisorsa,c.CostoOrario
        FROM impiegoBudget as i join dfCostoOrarioBudget as c 
        on c.AreaProduzione = i.NrAreaProduzione and c.Risorsa = i.Risorsa''')
        #(impiegoBudget.shape)
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




        #(sqldf('select sum(QuantitydiOutput) from impiegoBudgetOld'))
        #(sqldf('select sum(QuantitydiOutput) from impiegoBudgetNew'))




        impiegoBudgetNew = sqldf('''select NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,sum(TempoRisorsa) as TempoRisorsa,CostoOrario, sum(QuantitydiOutput) as QuantitydiOutput
        from impiegoBudgetNew
        group by NrArticolo,budgetConsuntivo,NrOrdineProduzione,Descrizione,NrAreaProduzione,Risorsa,CostoOrario
        order by NrArticolo
        ''')




        impiegoBudgetNew

        sqldf('''select NrArticolo, NrOrdineProduzione, Descrizione, NrAreaProduzione, Risorsa, count(*)
        from impiegoBudgetNew 
        group by NrArticolo, NrOrdineProduzione, Descrizione, NrAreaProduzione, Risorsa
        order by count(*) desc''')

        sqldf('''select NrArticolo, Descrizione, NrAreaProduzione, Risorsa, count(*)
        from impiegoBudgetNew 
        group by NrArticolo, Descrizione, NrAreaProduzione, Risorsa
        order by count(*) desc''')


        # # Scostamento totale



        sumImpiegoConsuntivo = sqldf(
            'SELECT sum(TempoRisorsa*CostoOrario) FROM impiegoConsuntivoNew WHERE TempoRisorsa>=0')
        sumImpiegoBudget = sqldf(
            'SELECT sum(TempoRisorsa*CostoOrario) FROM impiegoBudgetNew WHERE TempoRisorsa>=0')
        #(sumImpiegoConsuntivo)
        #(sumImpiegoBudget)
        #(sumImpiegoConsuntivo-sumImpiegoBudget)




        #(sumVenditeConsuntivo.values[0][0])
        #(sumImpiegoConsuntivo.values[0][0]+sumConsumiConsuntivo.values[0][0])
        #(sumVenditeConsuntivo.values[0][0]-sumImpiegoConsuntivo.values[0][0]-sumConsumiConsuntivo.values[0][0])
        #(sumVenditeBudget.values[0][0])
        #(sumImpiegoBudget.values[0][0]+sumConsumiBudget.values[0][0])
        #(sumVenditeBudget.values[0][0]-sumImpiegoBudget.values[0][0]-sumConsumiBudget.values[0][0])


        # Senza vincoli su tempi negativi
        # 
        # **non cambia perché per ogni tempo negativo esiste un tempo positivo uguale in modulo che, al sommare i tempi delle stesse attività, si annullano a vicenda**



        sumImpiegoConsuntivo = sqldf(
            'SELECT sum(TempoRisorsa*CostoOrario) FROM impiegoConsuntivoNew')
        sumImpiegoBudget = sqldf(
            'SELECT sum(TempoRisorsa*CostoOrario) FROM impiegoBudgetNew')
        #(sumImpiegoConsuntivo)
        #(sumImpiegoBudget)
        #(sumImpiegoConsuntivo-sumImpiegoBudget)




        #(sumVenditeConsuntivo.values[0][0])
        #(sumImpiegoConsuntivo.values[0][0]+sumConsumiConsuntivo.values[0][0])
        #(sumVenditeConsuntivo.values[0][0]-sumImpiegoConsuntivo.values[0][0]-sumConsumiConsuntivo.values[0][0])
        #(sumVenditeBudget.values[0][0])
        #(sumImpiegoBudget.values[0][0]+sumConsumiBudget.values[0][0])
        #(sumVenditeBudget.values[0][0]-sumImpiegoBudget.values[0][0]-sumConsumiBudget.values[0][0])


        # # Socostamento di volume, impiego e prezzo per le Lavorazioni

        # #### consuntivo



        # Creazione colonna ImpiegoUnitario
        impiegoConsuntivoNew = sqldf(''' select NrArticolo, budgetConsuntivo, NrOrdineProduzione, Descrizione, NrAreaProduzione, Risorsa, TempoRisorsa, TempoRisorsa/QuantitydiOutput as ImpiegoUnitario, CostoOrario ,QuantitydiOutput
        from impiegoConsuntivoNew''')
        impiegoConsuntivoNew


        # Avg out the null values



        impiegoConsuntivoNew = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, sum(TempoRisorsa) as TempoRisorsa, avg(CostoOrario) as CostoOrario, max(QuantitydiOutput) as QuantitydiOutput
        from impiegoConsuntivoNew
        group by NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione
        ''')
        impiegoConsuntivo = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, TempoRisorsa, (TempoRisorsa/QuantitydiOutput) as ImpiegoUnitario, CostoOrario,QuantitydiOutput
        from impiegoConsuntivoNew
        order by NrArticolo
        ''')




        sqldf('select sum(TempoRisorsa*CostoOrario) from impiegoConsuntivo') # si mantiene quasi uguale!!




        sqldf('select sum(ImpiegoUnitario*CostoOrario*QuantitydiOutput) from impiegoConsuntivo') 


        # la piccola differenza è dovuta alla restante parte di righe con output nulle e senza altre righe con output non nullo da sommare



        sqldf('select * from impiegoConsuntivo where ImpiegoUnitario is null') 


        # #### ripetiamo per budget



        impiegoBudgetNew = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, sum(TempoRisorsa) as TempoRisorsa, avg(CostoOrario) as CostoOrario, max(QuantitydiOutput) as QuantitydiOutput
        from impiegoBudgetNew
        group by NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione
        ''')
        impiegoBudget = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, TempoRisorsa, (TempoRisorsa/QuantitydiOutput) as ImpiegoUnitario, CostoOrario,QuantitydiOutput
        from impiegoBudgetNew
        order by NrArticolo
        ''')




        sqldf('select sum(TempoRisorsa*CostoOrario) from impiegoBudget') # si mantiene quasi uguale!!




        sqldf('select sum(ImpiegoUnitario*CostoOrario*QuantitydiOutput) from impiegoBudget') 




        sqldf('select * from impiegoBudget where ImpiegoUnitario is null') 


        # #### Merge/Join



        impiegoConsuntivo.drop(['budgetConsuntivo'], axis=1, inplace=True)
        impiegoBudget.drop(['budgetConsuntivo'], axis=1, inplace=True)
        x = pd.merge(impiegoConsuntivo, impiegoBudget, on=['NrArticolo', 'Descrizione', 'NrAreaProduzione'], how='outer')
        x




        c = sqldf('select sum(ImpiegoUnitario_x*CostoOrario_x*QuantitydiOutput_x) from x').iloc[0][0]
        b = sqldf('select sum(ImpiegoUnitario_y*CostoOrario_y*QuantitydiOutput_y) from x').iloc[0][0]
        #(c)
        #(b)
        #(c-b)
        # non altera i totali!!




        #Budget Standard
        BudgetStandardLav = sqldf('select sum(ImpiegoUnitario_y*CostoOrario_y*QuantitydiOutput_y) from x').iloc[0][0]
        # Impiego Standard (volume a consuntivo)
        ImpiegoStandardLav = sqldf('select sum(ImpiegoUnitario_y*CostoOrario_y*QuantitydiOutput_x) from x').iloc[0][0]
        # Impiego Effettivo (volume e impiego a consuntivo)
        ImpiegoEffettivoLav=sqldf('select sum(ImpiegoUnitario_x*CostoOrario_y*QuantitydiOutput_x) from x').iloc[0][0]
        # Budget Effettivo (tutto a consuntivo)
        BudgetEffettivoLav=sqldf('select sum(ImpiegoUnitario_x*CostoOrario_x*QuantitydiOutput_x) from x').iloc[0][0]
        #(BudgetStandardLav)
        #(ImpiegoStandardLav)
        #(ImpiegoEffettivoLav)
        #(BudgetEffettivoLav)




        sqldf('select ImpiegoUnitario_y,CostoOrario_y,QuantitydiOutput_x from x order by QuantitydiOutput_x desc')




        #Scostamenti
        ScostamentoVolumeLav = ImpiegoStandardLav-b
        ScostamentoImpiegoLav = ImpiegoEffettivoLav-ImpiegoStandardLav
        ScostamentoPrezzoLav = BudgetEffettivoLav-ImpiegoEffettivoLav
        #(ScostamentoVolumeLav)
        #(ScostamentoImpiegoLav)
        #(ScostamentoPrezzoLav)
        #(ScostamentoVolumeLav+ScostamentoImpiegoLav+ScostamentoPrezzoLav)


        # # Socostamento di volume, impiego e prezzo per le materie prime

        # #### Group by CodiceMP

        # se non facciamo qualche group by a priori si sdoppiano le righe, proviamo prima con CodiceMP



        consumiConsuntivoUnitByMP = sqldf('''select CodiceMP, NrArticolo, NrDocumento as NrOrdineProduzione, sum(QuantityMPImpiegata) as QuantityMPImpiegata, sum(ImportoCostoTOTALE) as ImportoCostoTOTALE
        from consumiConsuntivo     
        group by CodiceMP, NrArticolo, NrOrdineProduzione''')
        consumiBudgetUnitByMP = sqldf('''select CodiceMP, NrArticolo,NrDocumento as NrOrdineProduzione, sum(QuantityMPImpiegata) as QuantityMPImpiegata, sum(ImportoCostoTOTALE) as ImportoCostoTOTALE
        from consumiBudget     
        group by CodiceMP, NrArticolo,NrOrdineProduzione''')
        consumiConsuntivoUnitByMP


        # ##### ritrovare volumi di produzione



        temp = sqldf('''select a.CodiceMP,a.NrArticolo,a.NrOrdineProduzione,a.QuantityMPImpiegata,a.ImportoCostoTOTALE,
        (select max(QuantitydiOutput) from impiegoConsuntivoNew  where a.NrArticolo = NrArticolo and a.NrOrdineProduzione = NrOrdineProduzione) as QuantitydiOutput
        from consumiConsuntivoUnitByMP as a''')
        temp = sqldf('''select distinct CodiceMP,NrArticolo,sum(QuantityMPImpiegata) as QuantityMPImpiegata,sum(ImportoCostoTOTALE) as ImportoCostoTOTALE ,QuantitydiOutput 
        from temp group by CodiceMP,NrArticolo''')
        temp




        temp = sqldf('''select a.CodiceMP,a.NrArticolo,a.NrOrdineProduzione,a.QuantityMPImpiegata,a.ImportoCostoTOTALE,
        (select max(QuantitydiOutput) from impiegoConsuntivoNew  where a.NrArticolo = NrArticolo and a.NrOrdineProduzione = NrOrdineProduzione) as QuantitydiOutput
        from consumiConsuntivoUnitByMP as a''')
        temp = sqldf('''select distinct CodiceMP,NrArticolo,sum(QuantityMPImpiegata) as QuantityMPImpiegata,sum(ImportoCostoTOTALE) as ImportoCostoTOTALE ,QuantitydiOutput 
        from temp group by CodiceMP,NrArticolo''')
        consumiConsuntivoVolProd = sqldf('''select distinct CodiceMP,NrArticolo,QuantityMPImpiegata/QuantitydiOutput as ImpiegoPerPezzo,ImportoCostoTOTALE/QuantityMPImpiegata as CostoPerUnitaMis,QuantitydiOutput, ImportoCostoTOTALE
        from temp group by CodiceMP,NrArticolo''')

        temp = sqldf('''select a.CodiceMP,a.NrArticolo,a.NrOrdineProduzione,a.QuantityMPImpiegata,a.ImportoCostoTOTALE,
        (select max(QuantitydiOutput) from impiegoBudgetNew  where a.NrArticolo = NrArticolo and a.NrOrdineProduzione = NrOrdineProduzione) as QuantitydiOutput
        from consumiBudgetUnitByMP as a''')
        temp = sqldf('''select distinct CodiceMP,NrArticolo,sum(QuantityMPImpiegata) as QuantityMPImpiegata,sum(ImportoCostoTOTALE) as ImportoCostoTOTALE ,QuantitydiOutput 
        from temp group by CodiceMP,NrArticolo''')
        consumiBudgetVolProd  = sqldf('''select distinct CodiceMP,NrArticolo,QuantityMPImpiegata/QuantitydiOutput as ImpiegoPerPezzo,ImportoCostoTOTALE/QuantityMPImpiegata as CostoPerUnitaMis,QuantitydiOutput, ImportoCostoTOTALE
        from temp group by CodiceMP,NrArticolo''')

        consumiConsuntivoVolProd




        #(consumiConsuntivoVolProd.shape, consumiConsuntivoUnitByMP.shape)
        #(consumiBudgetVolProd.shape, consumiBudgetVolProd.shape)




        #(sqldf('select * from consumiConsuntivoVolProd where CostoPerUnitaMis is null').shape)
        #(sqldf('select * from consumiBudgetVolProd where CostoPerUnitaMis is null').shape)
        # TODO rimuovere la maggior parte di quanitity nulle possibile dalle lavorazioni continua a essere importante!




        #(sqldf('select sum(ImportoCostoTOTALE) from consumiConsuntivoUnitByMP'))
        #(sqldf('select sum(ImpiegoPerPezzo*CostoPerUnitaMis*QuantitydiOutput) from consumiConsuntivoVolProd'))
        #(sqldf('select sum(ImportoCostoTOTALE) from consumiBudgetUnitByMP'))
        #(sqldf('select sum(ImpiegoPerPezzo*CostoPerUnitaMis*QuantitydiOutput) from consumiBudgetVolProd'))
        # non si perdono dei decimali 


        # ##### Scostamenti



        #consumiConsuntivoVolProd.drop(columns='NrOrdineProduzione',inplace=True)
        #consumiBudgetVolProd.drop(columns='NrOrdineProduzione',inplace=True)




        ConsumiUnit = pd.merge(consumiConsuntivoVolProd,consumiBudgetVolProd, on = ['CodiceMP','NrArticolo'], how = 'outer')
        ConsumiUnit




        BudgetEffettivoMP = sqldf('select sum(QuantitydiOutput_x*ImpiegoPerPezzo_x*CostoPerUnitaMis_x) from ConsumiUnit').iloc[0][0]
        ImpiegoEffettivoMP = sqldf('select sum(QuantitydiOutput_x*ImpiegoPerPezzo_x*CostoPerUnitaMis_y) from ConsumiUnit').iloc[0][0]
        ImpiegoStandardMP = sqldf('select sum(QuantitydiOutput_x*ImpiegoPerPezzo_y*CostoPerUnitaMis_y) from ConsumiUnit').iloc[0][0]
        BudgetStandardMP = sqldf('select sum(QuantitydiOutput_y*ImpiegoPerPezzo_y*CostoPerUnitaMis_y) from ConsumiUnit').iloc[0][0]
        ScostamentoVolumeMP =  ImpiegoStandardMP - BudgetStandardMP
        ScostamentoImpiegoMP = ImpiegoEffettivoMP-ImpiegoStandardMP
        ScostamentoPrezzoMP = BudgetEffettivoMP-ImpiegoEffettivoMP 




        #(BudgetEffettivoMP)
        #(ImpiegoEffettivoMP)
        #(ImpiegoStandardMP)
        #(BudgetStandardMP)
        #(ScostamentoVolumeMP)
        #(ScostamentoImpiegoMP)
        #(ScostamentoPrezzoMP)
        #(ScostamentoVolumeMP+ScostamentoImpiegoMP+ScostamentoPrezzoMP) 


        # # Socostamento di volume, mix e prezzo per i ricavi

        #  group by NrArticolo dei ricavi



        venditeConsuntivoArt = sqldf('''select NrArticolo, sum(Quantity) as Quantity, sum(TotaleEuro) as TotaleEuro
                from venditeConsuntivo
                group by NrArticolo''')
        venditeConsuntivoArt




        venditeBudgetArt = sqldf('''select NrArticolo, sum(Quantity) as Quantity, sum(TotaleEuro) as TotaleEuro
                from venditeBudget
                group by NrArticolo''')
        venditeBudgetArt


        # ##### calcolo del delta dei volumi 




        vendite = pd.merge(venditeConsuntivoArt,venditeBudgetArt, on = ['NrArticolo'], how = 'outer')
        vendite




        sqldf('''select sum(TotaleEuro_x) from vendite''')




        sqldf('''select sum(TotaleEuro_y) from vendite''')




        sqldf('''select NrArticolo, Quantity_x-Quantity_y as DiffQuantity
                from vendite
                order by DiffQuantity desc
                ''')




        sqldf('''select sum(Quantity_x-Quantity_y) as DiffQuantity
                from vendite
                ''')


        # ##### creazione colonne mix, volume, prezzo unitario



        venditeBudgetS = sqldf('''select NrArticolo, (Quantity*100000000000/7224) as Mix, 7224 as VolumeTotale, TotaleEuro/Quantity as PrezzoUnitario
                from venditeBudgetArt''')
        venditeBudgetS




        sqldf('select sum(Mix*VolumeTotale*PrezzoUnitario)/100000000000 from venditeBudgetS')




        sqldf('select sum(Quantity) from venditeConsuntivo')




        venditeConsuntivoS = sqldf('''select NrArticolo, (Quantity*100000000000/9329) as Mix, 9329 as VolumeTotale, TotaleEuro/Quantity as PrezzoUnitario
                from venditeConsuntivoArt''')
        venditeConsuntivoS




        sqldf('select sum(Mix*VolumeTotale*PrezzoUnitario)/100000000000 from venditeConsuntivoS')


        # ### Calcolo socostamenti di volume, mix e prezzo



        venditeS = pd.merge(venditeConsuntivoS, venditeBudgetS, on = ['NrArticolo'], how = 'outer')
        venditeS




        sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_x)/100000000000 from venditeS')




        x = sqldf('select NrArticolo,(Mix_y*VolumeTotale_y*PrezzoUnitario_y)/100000000000 as c from venditeS ')
        x




        BudgetStandardRic = sqldf('select sum(Mix_y*VolumeTotale_y*PrezzoUnitario_y)/100000000000 from venditeS ').iloc[0][0]
        MixStandardRic = sqldf('select sum(Mix_y*VolumeTotale_x*PrezzoUnitario_y)/100000000000 from venditeS ').iloc[0][0]
        MixEffettivoRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_y)/100000000000 from venditeS ').iloc[0][0]
        BudgetEffettivoRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_x)/100000000000 from venditeS ').iloc[0][0]




        #(BudgetStandardRic)
        #(MixStandardRic)
        #(MixEffettivoRic)
        #(BudgetEffettivoRic)




        ScostamentoVolumeRic = MixStandardRic-BudgetStandardRic
        ScostamentoMixRic = MixEffettivoRic-MixStandardRic
        ScostamentoPrezzoRic = BudgetEffettivoRic-MixEffettivoRic




        #(ScostamentoVolumeRic)
        #(ScostamentoMixRic)
        #(ScostamentoPrezzoRic)
        #(ScostamentoVolumeRic+ScostamentoMixRic+ScostamentoPrezzoRic)


        # # Vista globale degli scostamenti



        data = {'Index': ['Ricavi', 'CostiMP', 'CostiLav', 'Margine'], 
                'Budget' : [BudgetStandardRic, BudgetStandardMP,BudgetStandardLav, (BudgetStandardRic - (BudgetStandardMP+BudgetStandardLav))],
                'ScostamentoVolume' : [ScostamentoVolumeRic,ScostamentoVolumeMP,ScostamentoVolumeLav, (ScostamentoVolumeRic - (ScostamentoVolumeMP+ScostamentoVolumeLav))], 
                'MixStandard' : [MixStandardRic, ImpiegoStandardMP,ImpiegoStandardLav, (MixStandardRic - (ImpiegoStandardMP+ImpiegoStandardLav))],
                'ScostamentoMix' : [ScostamentoMixRic,ScostamentoImpiegoMP,ScostamentoImpiegoLav, (ScostamentoMixRic - (ScostamentoImpiegoMP+ScostamentoImpiegoLav))],
                'MixEffettivo' : [MixEffettivoRic, ImpiegoEffettivoMP,ImpiegoEffettivoLav, (MixEffettivoRic - (ImpiegoEffettivoMP+ImpiegoEffettivoLav))],
                'ScostamentoPrezzo' : [ScostamentoPrezzoRic,ScostamentoPrezzoMP,ScostamentoPrezzoLav, (ScostamentoPrezzoRic - (ScostamentoPrezzoMP+ScostamentoPrezzoLav))], 
                'Consuntivo' : [BudgetEffettivoRic, BudgetEffettivoMP, BudgetEffettivoLav, (BudgetEffettivoRic - (BudgetEffettivoMP+BudgetEffettivoLav))],
                'ScostamentoTotale' : [BudgetEffettivoRic-BudgetStandardRic,BudgetEffettivoMP-BudgetStandardMP,BudgetEffettivoLav-BudgetStandardLav, (BudgetEffettivoRic - BudgetStandardRic - (BudgetEffettivoMP-BudgetStandardMP+BudgetEffettivoLav-BudgetStandardLav))]}




        pd.DataFrame(data)




        #(-119959.519152+96308.420839-125320.243955)


        # # Repeat ma tenendo conto della valuta



        venditeConsuntivoArt = sqldf('''select NrArticolo, sum(Quantity) as Quantity,  sum(ImportoVenditaValutaLocaleTOTALEVENDITA) as TotaleLocale, Valuta, TassoCambioMedio
                from venditeConsuntivo
                group by NrArticolo, Valuta, TassoCambioMedio''')
        venditeBudgetArt = sqldf('''select NrArticolo, sum(Quantity) as Quantity, sum(ImportoVenditaValutaLocaleTOTALEVENDITA) as TotaleLocale, Valuta, TassoCambioMedio
                from venditeBudget
                group by NrArticolo, Valuta, TassoCambioMedio ''')




        venditeBudgetArt


        # ##### creazione colonne mix, volume, prezzo unitario (locale)



        venditeConsuntivoS = sqldf('''select NrArticolo, (Quantity*100000000000/9329) as Mix, 9329 as VolumeTotale, TotaleLocale/Quantity as PrezzoUnitario, Valuta, TassoCambioMedio, (TotaleLocale/Quantity)/TassoCambioMedio as PrezzoUnitarioEuro
                from venditeConsuntivoArt''')
        venditeBudgetS = sqldf('''select NrArticolo, (Quantity*100000000000/7224) as Mix, 7224 as VolumeTotale, TotaleLocale/Quantity as PrezzoUnitario, Valuta, TassoCambioMedio, (TotaleLocale/Quantity)/TassoCambioMedio as PrezzoUnitarioEuro
                from venditeBudgetArt''')


        # ### Calcolo socostamenti di volume, mix, prezzo e valuta



        venditeS1 = pd.merge(venditeConsuntivoS, venditeBudgetS, on = ['NrArticolo', 'Valuta'], how = 'outer')
        venditeS1
        #venditeS1.to_excel('venditeS1.xlsx')




        BudgetStandardRic = sqldf('select sum(Mix_y*VolumeTotale_y*PrezzoUnitario_y/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
        MixStandardRic = sqldf('select sum(Mix_y*VolumeTotale_x*PrezzoUnitario_y/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
        MixEffettivoRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_y/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
        BudgetEffettivoRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_x/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
        BudgetEffettivoValutaRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_x/TassoCambioMedio_x)/100000000000 from venditeS1 ').iloc[0][0]




        #(BudgetStandardRic)
        #(MixStandardRic)
        #(MixEffettivoRic)
        #(BudgetEffettivoRic)
        #(BudgetEffettivoValutaRic)




        ScostamentoVolumeRic = MixStandardRic-BudgetStandardRic
        ScostamentoMixRic = MixEffettivoRic-MixStandardRic
        ScostamentoPrezzoRic = BudgetEffettivoRic-MixEffettivoRic
        ScostamentoValutaRic = BudgetEffettivoValutaRic-BudgetEffettivoRic




        #(ScostamentoVolumeRic)
        #(ScostamentoMixRic)
        #(ScostamentoPrezzoRic)
        #(ScostamentoValutaRic)
        #(ScostamentoVolumeRic+ScostamentoMixRic+ScostamentoPrezzoRic+ScostamentoValutaRic)


        # # Vista globale degli scostamenti v2



        data = {'Index': ['Ricavi', 'CostiMP', 'CostiLav', 'Margine'], 
                'Budget' : [BudgetStandardRic, BudgetStandardMP,BudgetStandardLav, (BudgetStandardRic - (BudgetStandardMP+BudgetStandardLav))],
                'ScostamentoVolume' : [ScostamentoVolumeRic,ScostamentoVolumeMP,ScostamentoVolumeLav, (ScostamentoVolumeRic - (ScostamentoVolumeMP+ScostamentoVolumeLav))], 
                'MixStandard' : [MixStandardRic, ImpiegoStandardMP,ImpiegoStandardLav, (MixStandardRic - (ImpiegoStandardMP+ImpiegoStandardLav))],
                'ScostamentoMix' : [ScostamentoMixRic,ScostamentoImpiegoMP,ScostamentoImpiegoLav, (ScostamentoMixRic - (ScostamentoImpiegoMP+ScostamentoImpiegoLav))],
                'MixEffettivo' : [MixEffettivoRic, ImpiegoEffettivoMP,ImpiegoEffettivoLav, (MixEffettivoRic - (ImpiegoEffettivoMP+ImpiegoEffettivoLav))],
                'ScostamentoPrezzo' : [ScostamentoPrezzoRic,ScostamentoPrezzoMP,ScostamentoPrezzoLav, (ScostamentoPrezzoRic - (ScostamentoPrezzoMP+ScostamentoPrezzoLav))], 
                'MixValuta' : [BudgetEffettivoRic, BudgetEffettivoMP,BudgetEffettivoLav, (BudgetEffettivoRic - (BudgetEffettivoMP+BudgetEffettivoLav))],
                'ScostamentoValuta' : [ScostamentoValutaRic, 0, 0, (ScostamentoValutaRic - (0+0))],
                'Consuntivo' : [BudgetEffettivoValutaRic, BudgetEffettivoMP, BudgetEffettivoLav, (BudgetEffettivoValutaRic - (BudgetEffettivoMP+BudgetEffettivoLav))],
                'ScostamentoTotale' : [BudgetEffettivoValutaRic-BudgetStandardRic,BudgetEffettivoMP-BudgetStandardMP,BudgetEffettivoLav-BudgetStandardLav, (BudgetEffettivoValutaRic - BudgetStandardRic - (BudgetEffettivoMP-BudgetStandardMP+BudgetEffettivoLav-BudgetStandardLav))]}
        # MOL
        molBudget = (BudgetStandardRic - (BudgetStandardMP+BudgetStandardLav))
        molScostamentoVol = (ScostamentoVolumeRic - (ScostamentoVolumeMP+ScostamentoVolumeLav))
        molMixStandard =  (MixStandardRic - (ImpiegoStandardMP+ImpiegoStandardLav))
        molScostamentoMix = (ScostamentoMixRic - (ScostamentoImpiegoMP+ScostamentoImpiegoLav))
        molMixEffettivo = (MixEffettivoRic - (ImpiegoEffettivoMP+ImpiegoEffettivoLav))
        molScostamentoPrezzo = (ScostamentoPrezzoRic - (ScostamentoPrezzoMP+ScostamentoPrezzoLav))
        molMixValuta = (BudgetEffettivoRic - (BudgetEffettivoMP+BudgetEffettivoLav))
        molScostamentoValuta = (ScostamentoValutaRic - (0+0))
        molConsuntivo = (BudgetEffettivoValutaRic - (BudgetEffettivoMP+BudgetEffettivoLav))
        molScostamentoTot = (BudgetEffettivoValutaRic - BudgetStandardRic - (BudgetEffettivoMP-BudgetStandardMP+BudgetEffettivoLav-BudgetStandardLav))

        # RICAVI
        ricaviBudget = BudgetStandardRic
        ricaviScostamentoVol = ScostamentoVolumeRic
        ricaviMixStandard = MixStandardRic
        ricaviScostamentoMix = ScostamentoMixRic
        ricaviMixEffettivo = ScostamentoMixRic
        ricaviScostamentoPrezzo = ScostamentoPrezzoRic
        ricaviMixValuta = BudgetEffettivoRic
        ricaviScostamentoValuta = ScostamentoValutaRic
        ricaviConsuntivo = BudgetEffettivoValutaRic
        ricaviScostamentoTot = BudgetEffettivoValutaRic-BudgetStandardRic


        # MATERIE PRIME
        materiePrimeBudget = BudgetStandardMP
        materiePrimeScostamentoVol = ScostamentoVolumeMP
        materiePrimeMixStandard = ImpiegoStandardMP
        materiePrimeScostamentoMix = ScostamentoImpiegoMP
        materiePrimeMixEffettivo = ImpiegoEffettivoMP
        materiePrimeScostamentoPrezzo = ScostamentoPrezzoMP
        materiePrimeMixValuta = BudgetEffettivoMP
        materiePrimeScostamentoValuta = 0
        materiePrimeConsuntivo = BudgetEffettivoMP
        materiePrimeScostamentoTot = BudgetEffettivoMP-BudgetStandardMP

        # LAVORAZIONI INTERNE
        lavorazioniInterneBudget = BudgetStandardLav
        lavorazioniInterneScostamentoVol = ScostamentoVolumeLav
        lavorazioniInterneMixStandard = ImpiegoStandardLav
        lavorazioniInterneScostamentoMix = ScostamentoImpiegoLav
        lavorazioniInterneMixEffettivo = ImpiegoEffettivoLav
        lavorazioniInterneScostamentoPrezzo = ScostamentoPrezzoLav
        lavorazioniInterneMixValuta = BudgetEffettivoLav
        lavorazioniInterneScostamentoValuta = 0
        lavorazioniInterneConsuntivo = BudgetEffettivoLav
        lavorazioniInterneScostamentoTot = BudgetEffettivoLav-BudgetStandardLav

        # COSTI TOTALI
        costiTotaliBudget = BudgetStandardMP + BudgetStandardLav
        costiTotaliScostamentoVol = ScostamentoVolumeMP + ScostamentoVolumeLav
        costiTotaliMixStandard = ImpiegoStandardMP + ImpiegoStandardLav
        costiTotaliScostamentoMix = ScostamentoImpiegoMP + ScostamentoImpiegoLav
        costiTotaliMixEffettivo = ImpiegoEffettivoMP + ImpiegoEffettivoLav
        costiTotaliScostamentoPrezzo = ScostamentoPrezzoMP + ScostamentoPrezzoLav
        costiTotaliMixValuta = BudgetEffettivoMP + BudgetEffettivoLav
        costiTotaliScostamentoValuta = 0
        costiTotaliConsuntivo = BudgetEffettivoMP + BudgetEffettivoLav
        costiTotaliScostamentoTot = (BudgetEffettivoMP-BudgetStandardMP) + (BudgetEffettivoLav-BudgetStandardLav) 
    
    

        pd.DataFrame(data)

        # come vedremo, i volumi di vendita non coincidono ai volumi di produzione, come negli esercizi fatti a lezione.
        # 
        #vece, a budget, si vendenono circa 412 prodotti diversi, mentre si lavorano circa 503, dei quali soltanto 73 passano per una fase di montaggio nell'anno in quesitone.
        # 
        # Questo ci porta alla conclusione che ci sono delle rimanenze, e non tutto cio che e prodotto nell'anno e venduto nello stesso anno.



        impiegoBudgetNew




        sqldf('select NrArticolo, QuantitydiOutput from impiegoBudgetNew group by NrArticolo,QuantitydiOutput order by NrArticolo')




        sqldf('select NrArticolo,Quantity from venditeBudget group by NrArticolo,Quantity order by NrArticolo')




        sqldf('select NrArticolo,sum(Quantity) as quantita from venditeBudget group by NrArticolo order by NrArticolo')




        sqldf("SELECT DISTINCT NrArticolo FROM dfImpiegoRisorse WHERE (budgetConsuntivo = 'BUDGET' or budgetConsuntivo = 'Budget')")




        sqldf("SELECT DISTINCT NrArticolo,QuantitydiOutput FROM dfImpiegoRisorse WHERE (budgetConsuntivo = 'BUDGET' or budgetConsuntivo = 'Budget') and Descrizione = 'Montaggio'")




        pd.merge(
            sqldf('select NrArticolo,sum(Quantity) as quantita from venditeBudget group by NrArticolo order by NrArticolo'),
            sqldf("SELECT DISTINCT NrArticolo,QuantitydiOutput FROM dfImpiegoRisorse WHERE (budgetConsuntivo = 'BUDGET' or budgetConsuntivo = 'Budget') and Descrizione = 'Montaggio'"), 
            on='NrArticolo', how='outer')




        venditeConsuntivo.to_excel('venditeConsuntivo.xlsx')


        # # By Criterion



        def by_client(dfVendite, client):
                dfVendite.rename(columns = {'budget/cons':'budget'}, inplace = True)
                venditeConsuntivo = sqldf("SELECT DISTINCT * FROM dfVendite WHERE budget = 'CONSUNTIVO' or budget = 'Consuntivo'")
                venditeBudget = sqldf("SELECT DISTINCT * FROM dfVendite WHERE budget = 'BUDGET' or budget = 'Budget'")

                venditeConsuntivo = sqldf('''SELECT DISTINCT v.NrMovimento, v.budget, v.NrArticolo, v.Quantity, v.ImportoVenditaValutaLocaleTOTALEVENDITA,k.TassoCambioMedio,v.ImportoVenditaValutaLocaleTOTALEVENDITA/k.TassoCambioMedio as TotaleEuro, v.NrOrigine, c.CodCondizioniPagam, c.FattCumulative, c.Valuta
                FROM venditeConsuntivo as v join dfClienti as c on v.NrOrigine = c.Nr join dfCambio as k on c.Valuta = k.CodiceValuta
                where k.Anno = 'Consuntivo' or k.Anno = 'CONSUNTIVO'
                ''')

                venditeBudget = sqldf('''SELECT DISTINCT v.NrMovimento, v.budget, v.NrArticolo, v.Quantity, v.ImportoVenditaValutaLocaleTOTALEVENDITA,k.TassoCambioMedio,v.ImportoVenditaValutaLocaleTOTALEVENDITA/k.TassoCambioMedio as TotaleEuro, v.NrOrigine, c.CodCondizioniPagam, c.FattCumulative, c.Valuta
                FROM venditeBudget as v join dfClienti as c on v.NrOrigine = c.Nr join dfCambio as k on c.Valuta = k.CodiceValuta
                where k.Anno = 'Budget' or k.Anno = 'BUDGET'
                ''')

                venditeConsuntivo = sqldf('select * from venditeConsuntivo where NrOrigine = "'+client+'"')

                venditeBudget = sqldf('select * from venditeBudget where NrOrigine = "'+client+'"')

                venditeConsuntivoArt = sqldf('''select NrArticolo, sum(Quantity) as Quantity,  sum(ImportoVenditaValutaLocaleTOTALEVENDITA) as TotaleLocale, Valuta, TassoCambioMedio
                        from venditeConsuntivo
                        group by NrArticolo, Valuta, TassoCambioMedio''')
                venditeBudgetArt = sqldf('''select NrArticolo, sum(Quantity) as Quantity, sum(ImportoVenditaValutaLocaleTOTALEVENDITA) as TotaleLocale, Valuta, TassoCambioMedio
                        from venditeBudget
                        group by NrArticolo, Valuta, TassoCambioMedio ''')

                venditeConsuntivoS = sqldf('''select NrArticolo, (Quantity*100000000000/9329) as Mix, 9329 as VolumeTotale, TotaleLocale/Quantity as PrezzoUnitario, Valuta, TassoCambioMedio, (TotaleLocale/Quantity)/TassoCambioMedio as PrezzoUnitarioEuro
                        from venditeConsuntivoArt''')
                venditeBudgetS = sqldf('''select NrArticolo, (Quantity*100000000000/7224) as Mix, 7224 as VolumeTotale, TotaleLocale/Quantity as PrezzoUnitario, Valuta, TassoCambioMedio, (TotaleLocale/Quantity)/TassoCambioMedio as PrezzoUnitarioEuro
                        from venditeBudgetArt''')

                venditeS1 = pd.merge(venditeConsuntivoS, venditeBudgetS, on = ['NrArticolo', 'Valuta'], how = 'outer')
                venditeS1.fillna(0, inplace = True)
                venditeS1


                BudgetStandardRic = sqldf('select sum(Mix_y*VolumeTotale_y*PrezzoUnitario_y/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
                MixStandardRic = sqldf('select sum(Mix_y*VolumeTotale_x*PrezzoUnitario_y/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
                MixEffettivoRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_y/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
                BudgetEffettivoRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_x/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
                BudgetEffettivoValutaRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_x/TassoCambioMedio_x)/100000000000 from venditeS1 ').iloc[0][0]

                if(BudgetStandardRic is None):
                    BudgetStandardRic = 0

                if(BudgetEffettivoValutaRic is None):
                    BudgetEffettivoValutaRic = 0

                ScostamentoVolumeRic = MixStandardRic-BudgetStandardRic
                ScostamentoMixRic = MixEffettivoRic-MixStandardRic
                ScostamentoPrezzoRic = BudgetEffettivoRic-MixEffettivoRic
                ScostamentoValutaRic = BudgetEffettivoValutaRic-BudgetEffettivoRic

                dicResult = {
                'BudgetStandardRic':BudgetStandardRic,
                'MixStandardRic':MixStandardRic,
                'MixEffettivoRic':MixEffettivoRic,
                'BudgetEffettivoRic':BudgetEffettivoRic,
                'BudgetEffettivoValutaRic':BudgetEffettivoValutaRic,
                'ScostamentoVolumeRic':ScostamentoVolumeRic,
                'ScostamentoMixRic':ScostamentoMixRic,
                'ScostamentoPrezzoRic':ScostamentoPrezzoRic,
                'ScostamentoValutaRic':ScostamentoValutaRic,
                'ScostamentoTotaleRic' : ScostamentoVolumeRic+ScostamentoMixRic+ScostamentoPrezzoRic+ScostamentoValutaRic
                }

                return dicResult





        e = by_client(dfVendite, 'C00471')
        e




        def by_client(dfVendite,dfConsumi,impiegoConsuntivo1, impiegoBudget1, client):

            dfVendite.rename(columns = {'budget/cons':'budget'}, inplace = True)
            venditeConsuntivo = sqldf("SELECT DISTINCT * FROM dfVendite WHERE budget = 'CONSUNTIVO' or budget = 'Consuntivo'")
            venditeBudget = sqldf("SELECT DISTINCT * FROM dfVendite WHERE budget = 'BUDGET' or budget = 'Budget'")

            venditeConsuntivo = sqldf('''SELECT DISTINCT v.NrMovimento, v.budget, v.NrArticolo, v.Quantity, v.ImportoVenditaValutaLocaleTOTALEVENDITA,k.TassoCambioMedio,v.ImportoVenditaValutaLocaleTOTALEVENDITA/k.TassoCambioMedio as TotaleEuro, v.NrOrigine, c.CodCondizioniPagam, c.FattCumulative, c.Valuta
            FROM venditeConsuntivo as v join dfClienti as c on v.NrOrigine = c.Nr join dfCambio as k on c.Valuta = k.CodiceValuta
            where k.Anno = 'Consuntivo' or k.Anno = 'CONSUNTIVO'
            ''')

            venditeBudget = sqldf('''SELECT DISTINCT v.NrMovimento, v.budget, v.NrArticolo, v.Quantity, v.ImportoVenditaValutaLocaleTOTALEVENDITA,k.TassoCambioMedio,v.ImportoVenditaValutaLocaleTOTALEVENDITA/k.TassoCambioMedio as TotaleEuro, v.NrOrigine, c.CodCondizioniPagam, c.FattCumulative, c.Valuta
            FROM venditeBudget as v join dfClienti as c on v.NrOrigine = c.Nr join dfCambio as k on c.Valuta = k.CodiceValuta
            where k.Anno = 'Budget' or k.Anno = 'BUDGET'
            ''')

            venditeConsuntivo = sqldf('select * from venditeConsuntivo where NrOrigine = "'+client+'"')

            venditeBudget = sqldf('select * from venditeBudget where NrOrigine = "'+client+'"')

            venditeConsuntivoArt = sqldf('''select NrArticolo, sum(Quantity) as Quantity,  sum(ImportoVenditaValutaLocaleTOTALEVENDITA) as TotaleLocale, Valuta, TassoCambioMedio
            from venditeConsuntivo
            group by NrArticolo, Valuta, TassoCambioMedio''')
            venditeBudgetArt = sqldf('''select NrArticolo, sum(Quantity) as Quantity, sum(ImportoVenditaValutaLocaleTOTALEVENDITA) as TotaleLocale, Valuta, TassoCambioMedio
            from venditeBudget
            group by NrArticolo, Valuta, TassoCambioMedio ''')

            venditeConsuntivoS = sqldf('''select NrArticolo, (Quantity*100000000000/9329) as Mix, 9329 as VolumeTotale, TotaleLocale/Quantity as PrezzoUnitario, Valuta, TassoCambioMedio, (TotaleLocale/Quantity)/TassoCambioMedio as PrezzoUnitarioEuro
            from venditeConsuntivoArt''')
            venditeBudgetS = sqldf('''select NrArticolo, (Quantity*100000000000/7224) as Mix, 7224 as VolumeTotale, TotaleLocale/Quantity as PrezzoUnitario, Valuta, TassoCambioMedio, (TotaleLocale/Quantity)/TassoCambioMedio as PrezzoUnitarioEuro
            from venditeBudgetArt''')

            venditeS1 = pd.merge(venditeConsuntivoS, venditeBudgetS, on = ['NrArticolo', 'Valuta'], how = 'outer')
            venditeS1.fillna(0, inplace = True)
            venditeS1


            BudgetStandardRic = sqldf('select sum(Mix_y*VolumeTotale_y*PrezzoUnitario_y/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
            MixStandardRic = sqldf('select sum(Mix_y*VolumeTotale_x*PrezzoUnitario_y/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
            MixEffettivoRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_y/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
            BudgetEffettivoRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_x/TassoCambioMedio_y)/100000000000 from venditeS1 ').iloc[0][0]
            BudgetEffettivoValutaRic = sqldf('select sum(Mix_x*VolumeTotale_x*PrezzoUnitario_x/TassoCambioMedio_x)/100000000000 from venditeS1 ').iloc[0][0]

            if(BudgetStandardRic is None):
                BudgetStandardRic = 0

            if(MixStandardRic is None):
                    MixStandardRic = 0
            
            if(MixEffettivoRic is None):
                    MixEffettivoRic = 0
            
            if(BudgetEffettivoRic is None):
                    BudgetEffettivoRic = 0

            if(BudgetEffettivoValutaRic is None):
                BudgetEffettivoValutaRic = 0

            ScostamentoVolumeRic = MixStandardRic-BudgetStandardRic
            ScostamentoMixRic = MixEffettivoRic-MixStandardRic
            ScostamentoPrezzoRic = BudgetEffettivoRic-MixEffettivoRic
            ScostamentoValutaRic = BudgetEffettivoValutaRic-BudgetEffettivoRic

            

            # materia prima

            articoli = sqldf('select distinct NrArticolo from venditeS1')

            dfConsumi.rename(columns = {'Budget/cons':'budget'}, inplace = True)
            consumiConsuntivo = sqldf("SELECT DISTINCT * FROM dfConsumi WHERE budget = 'CONSUNTIVO' and NrArticolo in (select * from articoli)")
            consumiBudget = sqldf("SELECT DISTINCT * FROM dfConsumi WHERE budget = 'BUDGET' and NrArticolo in (select * from articoli)") 

            consumiConsuntivoUnit = sqldf('''select distinct NrMovimento, CodiceMP, NrArticolo, QuantityMPImpiegata, ImportoCostoTOTALE/QuantityMPImpiegata as CostoUnitario, ImportoCostoTOTALE 
            from consumiConsuntivo
            order by CodiceMP''')
            consumiBudgetUnit = sqldf('''select distinct NrMovimento, CodiceMP, NrArticolo, QuantityMPImpiegata, ImportoCostoTOTALE/QuantityMPImpiegata as CostoUnitario, ImportoCostoTOTALE 
            from consumiBudget
            order by CodiceMP''')

            consumiConsuntivoUnitByMP = sqldf('''select CodiceMP, NrArticolo,938999.16 as Volume, sum(QuantityMPImpiegata) as QuantityMPImpiegata,sum(ImportoCostoTOTALE)/sum(QuantityMPImpiegata) as CostoUnitario , sum(ImportoCostoTOTALE) as ImportoCostoTOTALE
            from consumiConsuntivoUnit      
            group by CodiceMP, NrArticolo''')
            consumiBudgetUnitByMP = sqldf('''select CodiceMP, NrArticolo,550834.0 as Volume, sum(QuantityMPImpiegata) as QuantityMPImpiegata,sum(ImportoCostoTOTALE)/sum(QuantityMPImpiegata) as CostoUnitario , sum(ImportoCostoTOTALE) as ImportoCostoTOTALE
            from consumiBudgetUnit      
            group by CodiceMP, NrArticolo''')

            conVol = sqldf('select CodiceMP, sum(QuantityMPImpiegata) as VolumeByMP from consumiConsuntivoUnitByMP group by CodiceMP')
            buVol = sqldf('select CodiceMP, sum(QuantityMPImpiegata) as VolumeByMP from consumiBudgetUnitByMP group by CodiceMP')

            consumiConsuntivoUnitByMP = sqldf('''select CodiceMP, NrArticolo, VolumeByMP, (QuantityMPImpiegata/VolumeByMP) as Impiego, CostoUnitario, ImportoCostoTOTALE
            from consumiConsuntivoUnitByMP natural join conVol ''')
            consumiBudgetUnitByMP = sqldf('''select CodiceMP, NrArticolo, VolumeByMP, (QuantityMPImpiegata/VolumeByMP) as Impiego, CostoUnitario, ImportoCostoTOTALE
            from consumiBudgetUnitByMP natural join buVol''')

            ConsumiUnit = pd.merge(consumiConsuntivoUnitByMP,consumiBudgetUnitByMP, on = ['CodiceMP','NrArticolo'], how = 'outer')

            BudgetEffettivoMP = sqldf('select sum(VolumeByMP_x*Impiego_x*CostoUnitario_x) from ConsumiUnit').iloc[0][0]
            ImpiegoEffettivoMP = sqldf('select sum(VolumeByMP_x*Impiego_x*CostoUnitario_y) from ConsumiUnit').iloc[0][0]
            ImpiegoStandardMP = sqldf('select sum(VolumeByMP_x*Impiego_y*CostoUnitario_y) from ConsumiUnit').iloc[0][0]
            BudgetStandardMP = sqldf('select sum(VolumeByMP_y*Impiego_y*CostoUnitario_y) from ConsumiUnit').iloc[0][0]
            ScostamentoVolumeMP =  ImpiegoStandardMP - BudgetStandardMP
            ScostamentoImpiegoMP = ImpiegoEffettivoMP-ImpiegoStandardMP
            ScostamentoPrezzoMP = BudgetEffettivoMP-ImpiegoEffettivoMP 

            # lavorazioni

            impiegoConsuntivoNew = sqldf(''' select NrArticolo, budgetConsuntivo, NrOrdineProduzione, Descrizione, NrAreaProduzione, Risorsa, TempoRisorsa, TempoRisorsa/QuantitydiOutput as ImpiegoUnitario, CostoOrario ,QuantitydiOutput
            from impiegoConsuntivo1
            where NrArticolo in (select * from articoli)''')
            impiegoConsuntivoNew.drop(['NrOrdineProduzione'], axis=1, inplace=True)

            impiegoConsuntivoNew = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, sum(TempoRisorsa) as TempoRisorsa, avg(CostoOrario) as CostoOrario, sum(QuantitydiOutput) as QuantitydiOutput
            from impiegoConsuntivoNew
            group by NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione
            ''')

            vol = sqldf('select NrArticolo, sum(QuantitydiOutput) as Volume from impiegoConsuntivoNew group by NrArticolo')

            impiegoConsuntivoNew = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, TempoRisorsa, (TempoRisorsa/Volume) as ImpiegoUnitario, CostoOrario, Volume ,QuantitydiOutput
            from impiegoConsuntivoNew natural join vol
            ''')

            impiegoBudgetNew = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, sum(TempoRisorsa) as TempoRisorsa, avg(CostoOrario) as CostoOrario, sum(QuantitydiOutput) as QuantitydiOutput
            from impiegoBudget1
            where NrArticolo in (select * from articoli)
            group by NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione
            ''')
            vol = sqldf('select NrArticolo, sum(QuantitydiOutput) as Volume from impiegoBudgetNew group by NrArticolo')

            impiegoBudgetNew = sqldf(''' select NrArticolo, budgetConsuntivo, Descrizione, NrAreaProduzione, TempoRisorsa, (TempoRisorsa/Volume) as ImpiegoUnitario, CostoOrario, Volume ,QuantitydiOutput
            from impiegoBudgetNew natural join vol
            ''')

            impiegoConsuntivoNew.drop(['budgetConsuntivo'], axis=1, inplace=True)
            impiegoBudgetNew.drop(['budgetConsuntivo'], axis=1, inplace=True)
            x = pd.merge(impiegoConsuntivoNew, impiegoBudgetNew, on=['NrArticolo', 'Descrizione', 'NrAreaProduzione'], how='outer')

            #Budget Standard
            BudgetStandardLav = sqldf('select sum(ImpiegoUnitario_y*CostoOrario_y*QuantitydiOutput_y	) from x').iloc[0][0]
            # Impiego Standard (volume a consuntivo)
            ImpiegoStandardLav = sqldf('select sum(ImpiegoUnitario_y*CostoOrario_y*QuantitydiOutput_x	) from x').iloc[0][0]
            # Impiego Effettivo (volume e impiego a consuntivo)
            ImpiegoEffettivoLav=sqldf('select sum(ImpiegoUnitario_x*CostoOrario_y*QuantitydiOutput_x	) from x').iloc[0][0]
            # Budget Effettivo (tutto a consuntivo)
            BudgetEffettivoLav=sqldf('select sum(ImpiegoUnitario_x*CostoOrario_x*QuantitydiOutput_x	) from x').iloc[0][0]

            ScostamentoVolumeLav = ImpiegoStandardLav-b
            ScostamentoImpiegoLav = ImpiegoEffettivoLav-ImpiegoStandardLav
            ScostamentoPrezzoLav = BudgetEffettivoLav-ImpiegoEffettivoLav

            data = {client: ['Ricavi', 'CostiMP', 'CostiLav', 'Margine'], 
            'Budget' : [BudgetStandardRic, BudgetStandardMP,BudgetStandardLav, (BudgetStandardRic - (BudgetStandardMP+BudgetStandardLav))],
            'ScostamentoVolume' : [ScostamentoVolumeRic,ScostamentoVolumeMP,ScostamentoVolumeLav, (ScostamentoVolumeRic - (ScostamentoVolumeMP+ScostamentoVolumeLav))], 
            'MixStandard' : [MixStandardRic, ImpiegoStandardMP,ImpiegoStandardLav, (MixStandardRic - (ImpiegoStandardMP+ImpiegoStandardLav))],
            'ScostamentoMix' : [ScostamentoMixRic,ScostamentoImpiegoMP,ScostamentoImpiegoLav, (ScostamentoMixRic - (ScostamentoImpiegoMP+ScostamentoImpiegoLav))],
            'MixEffettivo' : [MixEffettivoRic, ImpiegoEffettivoMP,ImpiegoEffettivoLav, (MixEffettivoRic - (ImpiegoEffettivoMP+ImpiegoEffettivoLav))],
            'ScostamentoPrezzo' : [ScostamentoPrezzoRic,ScostamentoPrezzoMP,ScostamentoPrezzoLav, (ScostamentoPrezzoRic - (ScostamentoPrezzoMP+ScostamentoPrezzoLav))], 
            'MixValuta' : [BudgetEffettivoRic, BudgetEffettivoMP,BudgetEffettivoLav, (BudgetEffettivoRic - (BudgetEffettivoMP+BudgetEffettivoLav))],
            'ScostamentoValuta' : [ScostamentoValutaRic, 0, 0, (ScostamentoValutaRic - (0+0))],
            'Consuntivo' : [BudgetEffettivoValutaRic, BudgetEffettivoMP, BudgetEffettivoLav, (BudgetEffettivoValutaRic - (BudgetEffettivoMP+BudgetEffettivoLav))],
            'ScostamentoTotale' : [BudgetEffettivoValutaRic-BudgetStandardRic,BudgetEffettivoMP-BudgetStandardMP,BudgetEffettivoLav-BudgetStandardLav, (BudgetEffettivoValutaRic - BudgetStandardRic - (BudgetEffettivoMP-BudgetStandardMP+BudgetEffettivoLav-BudgetStandardLav))]}

            data = pd.DataFrame(data)

            return data


        return "OK"
