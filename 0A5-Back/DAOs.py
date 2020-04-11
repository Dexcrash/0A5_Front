from pymongo import MongoClient
from flask import request
from datetime import datetime
from bson import ObjectId



client = MongoClient(
    "mongodb+srv://admin:adminPass@cluster0-e8ksn.mongodb.net/test?retryWrites=true&w=majority")
db = client.db0a5
date_format = '%d-%m-%Y'


class CategoriaDAO:

    def create_from_doc(self, doc):
        self.id = doc['id']
        self.nombre = doc['nombre']
        self.descripcion = doc['descripcion']
        self.motivacion = doc['motivacion']
        self.video_url = doc['video_url']
        self.foto_url = doc['foto_url']

    def create_from_request(self, request):
        self.id = -1
        self.nombre = request.json['nombre'],
        self.descripcion = request.json['descripcion']
        self.motivacion = request.json['motivacion']
        self.video_url = request.json['video_url']
        self.foto_url = request.json['foto_url']

    def get_by_id(self, p_id):
        cat = db.categorias.find_one({'id': p_id})
        self.create_from_doc(cat)
        return self

    def get_all(self):
        print('getting all categories, yay')
        cats = db.categorias.find()
        catList = list(cats)
        returnList = []
        for c in catList:
            newCat = CategoriaDAO()
            newCat.create_from_doc(c)
            returnList.append(newCat)
        return returnList


class EjercicioDAO:

    def create_from_doc(self, doc):
        self._id = str(doc['_id'])
        self.id_cat = doc['id_cat']
        self.nombre = doc['nombre']
        self.descripcion = doc['descripcion']
        self.video_url = doc['video_url']
        self.foto_url = doc['foto_url']
        self.duracion = doc['duracion']

    def create_from_request(self, request):
        self.id_cat = request.json['id_cat']
        self.nombre = request.json['nombre'],
        self.descripcion = request.json['descripcion']
        self.video_url = request.json['video_url']
        self.foto_url = request.json['foto_url']
        self.duracion = request.json['duracion']

    def get_by_id(self, _id):
        cat = db.ejercicios.find_one({'_id': ObjectId(_id)})
        dao = EjercicioDAO()
        dao.create_from_doc(cat)
        return dao

    def get_all(self):
        print('getting all excercizsesese, yay')
        ejercicios = db.ejercicios.find()
        ejList = list(ejercicios)
        returnList = []
        for e in ejList:
            newEj = EjercicioDAO()
            newEj.create_from_doc(e)
            returnList.append(newEj)
        return returnList

    def get_by_categoria(self, id_cat):
        print('getting all excercizsesese for the category: {}, yay'.format(id_cat))
        ejercicios = db.ejercicios.find({'id_cat': id_cat})
        ejList = list(ejercicios)
        returnList = []
        for e in ejList:
            newEj = EjercicioDAO()
            newEj.create_from_doc(e)
            returnList.append(newEj)
        return returnList


class KidDAO:
    def create_from_doc(self, doc):
        self._id = str(doc['_id'])
        self.nickname = doc['nickname']
        self.id_user = doc['id_user']
        self.fecha_nacimiento = doc['fecha_nacimiento']
        self.peso_actual = doc['peso_actual']

    def get_all(self):
        print("Getting all dem kids, yay")
        docs = db.kids.find()
        returnList = []
        for d in list(docs):
            newObj = KidDAO()
            newObj.create_from_doc(d)
            returnList.append(newObj)
        return returnList


class Ejercicio_KidDAO:
    def create_from_doc(self, doc):
        self._id = str(doc['_id'])
        self.fecha = doc['fecha']
        self.id_kid = doc['id_kid']
        self.id_ejercicio = doc['id_ejercicio']
        self.rating = doc['rating']

    def get_all(self):
        print("Getting all Excersice with dem kids, yay")
        docs = db.ejercicio_kid.find()
        returnList = []
        for d in list(docs):
            newObj = Ejercicio_KidDAO()
            newObj.create_from_doc(d)
            returnList.append(newObj)
        return returnList

    def get_by_kid_all(self, id_kid):
        print("Getting all Excersice of da kid: {}, yay".format(id_kid))
        docs = db.ejercicio_kid.find({'id_kid': id_kid})
        returnList = []
        for d in list(docs):
            newObj = Ejercicio_KidDAO()
            newObj.create_from_doc(d)
            returnList.append(newObj)
        return returnList

    def create_from_request(self, request):
        self.fecha = datetime.strptime(request.json['fecha'], date_format)
        self.id_kid = request.json['id_kid']
        self.id_ejercicio = request.json['id_ejercicio']
        self.rating = request.json['rating']

    def add_to_db(self, doc):
        inserted_id = db.ejercicio_kid.insert_one(vars(doc)).inserted_id
        doc = db.ejercicio_kid.find_one({'_id': inserted_id})
        obj = Ejercicio_KidDAO()
        obj.create_from_doc(doc)
        return obj

    def get_by_kid_week(self, id_kid, from_date):
        parsed_from_date = datetime.strptime(from_date, date_format)
        print(parsed_from_date)
        docs = db.ejercicio_kid.find({
            'fecha': 
                { "$gte":parsed_from_date }
            })
        returnList = []
        for d in list(docs):
            newObj = Ejercicio_KidDAO()
            newObj.create_from_doc(d)
            returnList.append(newObj)
        return returnList


