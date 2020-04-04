from flask import Flask
from pymongo import MongoClient
from flask import jsonify
from flask import request
from DAOs import CategoriaDAO
from DAOs import EjercicioDAO
from DAOs import Ejercicio_KidDAO
from DAOs import KidDAO

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

# Route: /categorias/<id_categoria>
@app.route('/categorias/<int:id_cat>', methods=['GET'])
def get_cat_byId(id_cat):
    dao = CategoriaDAO()
    
    return vars(dao.get_by_id(id_cat))

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


# Route /ejercicios
# Get
# Obtinene el ejercicio con el id
@app.route('/ejercicios', methods=['GET'])
def get_ejercicios():
    dao = EjercicioDAO()
    returnList = []
    for c in dao.get_all():
        returnList.append(vars(c))
    return jsonify(returnList)


# Route /ejercicios/<id_ejercicio>
# Get
# Obtinene el ejercicio con el id
@app.route('/ejercicios/<id_ejercicio>', methods=['GET'])
def get_ejercicio_id(id_ejercicio):
    dao = EjercicioDAO()
    return vars(dao.get_by_id(id_ejercicio))

# ROute /ejercicio_kid
# GET
#Obtiene la lista de ejercicio_kid
@app.route('/ejercicio_kid', methods=['GET'])
def get_all_ejercicio_kid():
    dao = Ejercicio_KidDAO()
    returnList = []
    for c in dao.get_all():
        returnList.append(vars(c))
    return jsonify(returnList)

# POST
# Crea un nuevo Ejercicio_kid con los parametros que entran por yeison
@app.route('/ejercicio_kid', methods=['POST'])
def create_ejercicio_kid():
    dao = Ejercicio_KidDAO()
    dao.create_from_request(request)
    return vars(dao.add_to_db(dao))
    

# Route /ejercicio_kid/<id_kid>
# GET
@app.route('/ejercicio_kid/<id_kid>', methods=['GET'])
def get_ejercicio_kid_by_kid(id_kid):
    dao = Ejercicio_KidDAO()
    returnList = []
    for d in dao.get_by_kid_all(id_kid):
        returnList.append(vars(d))
    return jsonify(returnList)


# Route /kids
# GET
# Obtiene la lista de ninos
@app.route('/kids', methods=['GET'])
def get_all_dem_kids():
    dao = KidDAO()
    returnList = []
    for c in dao.get_all():
        returnList.append(vars(c))
    return jsonify(returnList)