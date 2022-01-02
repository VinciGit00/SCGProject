import asyncio
import os
import os.path
from flask import Flask, request, send_from_directory, flash, request
from werkzeug.utils import secure_filename
import getpass
import platform
from flask_cors import CORS
from scripts.datascript import Datascript
from scripts.CalcoloScostamentiConIntermedi import  CalcoloScostamentiConIntermedi 


# This file contains all the apis required to upload the 


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

        # Predo i file selezionati dall'utente 
        files = request.files.getlist('file')
        print(files)

        # Itero i file selezionati e li carico nel filesystem uno ad uno
        for file in files:
            # Controllo che l'utente abbia selezionato almeno un file da caricare
            if file.filename == '':
                print('no file selezionato')
                return "KO" 

            # Controllo che il formato del file sia valido
            if file and allowed_file(file.filename):
                # Salvo il file nel file system
                file.save(os.path.join(UPLOAD_FOLDER, file.filename))

    return "OK" 


# Get csv graphs from folder 
@app.route('/get-csvgraph/<filename>')
def get_csv_graph(filename):
    return send_from_directory(DATASET_FOLDER, filename)


# Get test data from python scripts. It awaits data from the script
@app.route('/get-scriptdata')
async def get_script_data():
    return await CalcoloScostamentiConIntermedi.runCalcoloScostamenti()


# Format Datasets Script
@app.route('/format-datasets')
async def fix_dataset():
    return await FixDatas.runFixDatas()



if __name__ == "__main__":
    app.run()




