import os
from flask import Flask, request, send_from_directory

# This file contains all the apis required to upload the datasets and to get the graph images that will be displayed in the flutter frontend

app = Flask(__name__)

# PATHS
# Windows Raw uploaded datasets folder
UPLOAD_DATASET = r"C:\SCGProject\Datasets\RawDatasets"
# TODO Windows Raw uploaded datasets folder


# Windows Output Graphs folder
GRAPHS_IMAGES = r"C:\SCGProject\Datasets\Graphs"
# TODO MacOS Output Graphs folder


# Add paths to the app configuration
app.config['GRAPH_IMAGES'] = r"C:\SCGProject\Datasets\Graphs"


# TODO: upload dataset api


# Get Graph Image Api
@app.route('/get-graph-image/<filename>')
def get_graph(filename):
    return send_from_directory(app.config['GRAPH_IMAGES'], filename)


if __name__ == "__main__":
    app.run()
