from flask import Flask
from pymongo import MongoClient
from flask import jsonify
from flask import request
from DAOs import CategoriaDAO
from DAOs import EjercicioDAO
from DAOs import Ejercicio_KidDAO
from DAOs import KidDAO
from datetime import datetime
import DAOs
from pprint import pprint

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
# Obtiene la lista de ejercicio_kid
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


# Route /ejercicio_kid/<id_kid>/<date>
# GET
@app.route('/ejercicio_kid/<id_kid>/<date>', methods=['GET'])
def get_ejercicio_kid_by_kid_date(id_kid, date):
    dao = Ejercicio_KidDAO()
    returnList = []
    for d in dao.get_by_kid_week(id_kid, date):
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

# Route /kids/<id_kid>/ejercicios_cat/<date>
# GET
# Obtiene el numero de ejercicios por categoria que ha hecho desde la fecha date
@app.route('/kids/<id_kid>/ejercicios_cat/<date>')
def get_count_ejercicios_categoria_kid_from_date(id_kid, date):
    dao = Ejercicio_KidDAO()
    ejercicios = dao.get_by_kid_week(id_kid, date)
    count = contar_ejercicios_por_categoria(ejercicios)
    return jsonify(count)


# Route /kids/<id_kid>/ejercicios_cat/<date>
# GET
# Obtiene el numero de ejercicios por categoria que ha hecho desde la fecha date
@app.route('/kids/<id_kid>/ejercicios_cat')
def get_count_ejercicios_categoria_kid(id_kid):
    dao = Ejercicio_KidDAO()
    date = datetime.strftime(datetime.min, DAOs.date_format)
    date = '01-01-2000'
    ejercicios = dao.get_by_kid_week(id_kid, date)
    count = contar_ejercicios_por_categoria(ejercicios)
    return jsonify(count)


# Route /kids/<id_kid>/recomended
# GET
# Obtiene el numero de ejercicios por categoria que ha hecho desde la fecha date
@app.route('/kids/<id_kid>/recomended')
def get_recommended_kid(id_kid):
    dao = Ejercicio_KidDAO()
    ejer_dao = EjercicioDAO()
    # date = datetime.strftime(datetime.min, DAOs.date_format)
    date = '01-01-2000'
    ejercicios = dao.get_by_kid_week(id_kid, date)
    count, avg = ejercicios_por_ejercicio_promedio(ejercicios)
    idList = recomend_ejericios(count, avg, 6)
    print("idList")
    pprint(idList)
    returnList = []
    for ejer_id in idList:
        returnList.append(vars(ejer_dao.get_by_id(ejer_id)))
    
    return jsonify(returnList)


def contar_ejercicios_por_categoria(p_ejercicios):
    eDao = EjercicioDAO()
    categorias = {}
    ejercicios = {}
    for e in eDao.get_all():
        ejercicios[e._id] = e

    for ek in p_ejercicios:
        ek_cat = ejercicios[ek.id_ejercicio].id_cat
        if ek_cat in categorias:
            categorias[ek_cat] = categorias[ek_cat] + 1
        else:
            categorias[ek_cat] = 1

    print(categorias)
    return categorias


def ejercicios_por_ejercicio_promedio(p_ejercicios):
    eDao = EjercicioDAO()
    count = {}
    avg = {}
    for e in eDao.get_all():
        count[e._id] = 0
        avg[e._id] = -1

    for ek in p_ejercicios:
        avg[ek._id] = avg[ek.id_ejercicio] * count[ek.id_ejercicio] + ek.rating
        count[ek._id] = count[ek.id_ejercicio] + 1

    pprint(count)
    pprint(avg)
    return count, avg


def recomend_ejericios(count, avg, size):
    returnList = []
    for key in count:
        if len(returnList) < size:
            if len(returnList) == 0:
                returnList.append(key)
            else:
                added = False
                for i in range(len(returnList)):
                    print(count[key])
                    print(count[returnList[i]])
                    if count[key] <= count[returnList[i]] and not added:
                        returnList.insert(i, key)
                        added = True
                        break
                
                if not added:
                    returnList.append(key)

        else:
            for i in range(len(returnList)):
                if count[key] < count[returnList[i]]:
                    returnList.insert(i, key)
                    del returnList[-1]
                    break
                
    
    return returnList