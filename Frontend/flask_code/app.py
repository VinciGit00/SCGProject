import os
from flask import Flask, request, send_from_directory, flash, request
from flask_cors import CORS 
from werkzeug.utils import secure_filename

# This file contains all the apis required to upload the datasets and to get the graph images that will be displayed in the flutter frontend

app = Flask(__name__)
# CORS is required to allow other domains to access files and images on the webpage
CORS(app)

# Allowed dataset file extensions
ALLOWED_EXTENSIONS = {'csv', 'xlsx'}

# PATHS
# Raw uploaded datasets folder
UPLOAD_FOLDER_WIN = r"C:\SCGProject\Datasets\RawDatasets"
UPLOAD_FOLDER_OSX = r""

# Output Graphs folder
GRAPH_IMAGES = r"C:\SCGProject\Datasets\Graphs"

# Add paths to the app configuration
app.config['GRAPH_IMAGES'] = GRAPH_IMAGES 


#Controllo che il file caricato abbia il formato corretto
def allowed_file(filename):
    return '.' in filename and \
        filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
    

#@app.before_request
def before_request():
    if request.url.startswith('http://'):
        url = request.url.replace('http://', 'https://', 1)
        code = 301
        return redirect(url, code=code)


# Api per caricare il raw dataset
@app.route('/uploadDataset', methods = ['GET', 'POST'])
def uploadDataset():
    if request.method == 'POST':
        # Controllo se è presente un file nella POST request
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
            file.save(os.path.join(UPLOAD_FOLDER_WIN, filename))
            return "OK" 
    return "OK" 

    
# Get Graph Image Api
@app.route('/get-graph-image/<filename>')
def get_graph(filename):
    return send_from_directory(app.config['GRAPH_IMAGES'], filename)


if __name__ == "__main__":
    app.run(port = 80, host = 'localhost', ssl_context =('\SCGProject\Frontend\server.crt', '\SCGProject\Frontend\server.key'))




