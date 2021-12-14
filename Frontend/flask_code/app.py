import asyncio
import os
import os.path
from flask import Flask, request, send_from_directory, flash, request
from werkzeug.utils import secure_filename
import getpass
import platform
from flask_cors import CORS
from scripts.datascript import Datascript


# This file contains all the apis required to upload the datasets and to get the graph images that will be displayed in the flutter frontend

app = Flask(__name__)

# CORS is required to allow other domains to access files and images on the webpage
CORS(app)

# Allowed dataset file extensions
ALLOWED_EXTENSIONS = {'csv', 'xlsx'}

# PATHS
# Raw uploaded datasets folder
# Output Graphs folder

username = getpass.getuser()

if platform.system() == "Windows":
    UPLOAD_FOLDER = r"C:\SCGProject\Datasets\RawDatasets"
    DATASET_FOLDER = r"C:\SCGProject\Datasets\CsvForGraphing"

if platform.system() == "Darwin" :
    if(username == "marcovinciguerra"):
     UPLOAD_FOLDER = "/Users/marcovinciguerra/Github/SCGProject/Datasets/RawDatasets"
     DATASET_FOLDER = "/Users/marcovinciguerra/Github/SCGProject/Datasets/CsvForGraphing"
    elif(username == "davidguzman"):
        UPLOAD_FOLDER = "/Users/davidguzman/documents/Github/SCGProject/Datasets/RawDatasets"
        DATASET_FOLDER = "/Users/davidguzman/documents/Github/SCGProject/Datasets/CsvForGraphing"


#Controllo che il file caricato abbia il formato corretto
def allowed_file(filename):
    return '.' in filename and \
        filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
    
# Api per caricare il raw dataset
@app.route('/uploadDataset', methods = ['GET', 'POST'])
def uploadDataset():
    if request.method == 'POST':
        # Controllo se e presente un file nella POST request
        if 'file' not in request.files:
            print("no file selezionato")
            flash('No file part')
            return "KO"

        # accedo al file salvato 
        file = request.files['file']
        print(file)

        # Controllo che l'utente abbia selezionato un file da caricare
        # Se non ha selezionato nulla, viene creato un file vuoto con filename = ""
        if file.filename == '':
            print('no file selezionato')
            return "KO" 

        # Controllo che il formato del file sia valido
        if file and allowed_file(file.filename):
            # Creo un nome del file che sia compatibile con il file system del server
            filename = secure_filename(file.filename)
            # Salvo il file nel file system
            print("salvo file nel sistema")
            file.save(os.path.join(UPLOAD_FOLDER, filename))
            return "OK" 
    return "OK" 


# Get csv graphs from folder 
@app.route('/get-csvgraph/<filename>')
def get_csv_graph(filename):
    return send_from_directory(DATASET_FOLDER, filename)

# Get data from python scripts. It awaits data from the script
@app.route('/get-scriptdata')
async def get_script_data():
    return await Datascript.getData()

if __name__ == "__main__":
    app.run()




