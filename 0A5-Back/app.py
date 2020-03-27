from flask import Flask
from pymongo import MongoClient
from flask import jsonify
from flask import request
from DAOs import CategoriaDAO
from DAOs import EjercicioDAO

client = MongoClient(
    "mongodb+srv://admin:adminPass@cluster0-e8ksn.mongodb.net/test?retryWrites=true&w=majority")
db = client.tesis

app = Flask(__name__)


@app.route('/')
def hello_world():
    return "Welcome to the 0A5 API"


# route: /categorias

# GET
# obtiene la lista de categorias
@app.route('/categorias')
def getCategorias():
    dao = CategoriaDAO()
    returnList = []
    for c in dao.get_all():
        returnList.append(vars(c))
    return jsonify(returnList)

# Route: /categorias/<id>/ejercicios

# GET
# obtiene la lista de categorias
@app.route('/categorias/<int:id_cat>/ejercicios')
def get_ejercicios_categoria(id_cat):
    dao = EjercicioDAO()
    returnList = []
    for c in dao.get_by_categoria(id_cat):
        returnList.append(vars(c))
    return jsonify(returnList)