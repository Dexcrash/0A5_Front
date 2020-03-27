from pymongo import MongoClient
from flask import request


client = MongoClient(
    "mongodb+srv://admin:adminPass@cluster0-e8ksn.mongodb.net/test?retryWrites=true&w=majority")
db = client.db0a5


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
        cat = db.categorias.find_one({'id':p_id})
        return self.create_from_doc(cat)


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
        self.id = doc['id']
        self.id_cat = doc['id_cat']
        self.nombre = doc['nombre']
        self.descripcion = doc['descripcion']
        self.video_url = doc['video_url']
        self.foto_url = doc['foto_url']

    def create_from_request(self, request):
        self.id = -1
        self.id_cat = request.json['id_cat']
        self.nombre = request.json['nombre'],
        self.descripcion = request.json['descripcion']
        self.video_url = request.json['video_url']
        self.foto_url = request.json['foto_url']

    
    def get_by_id(self, p_id):
        cat = db.ejercicios.find_one({'id':p_id})
        return self.create_from_doc(cat)


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