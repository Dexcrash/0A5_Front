from flask import Flask
from pymongo import MongoClient
from flask import jsonify
from flask import request
from bson.objectid import ObjectId
from datetime import datetime
import hashlib

client = MongoClient(
    "mongodb+srv://admin:adminPass@cluster0-e8ksn.mongodb.net/test?retryWrites=true&w=majority")
db = client.tesis

app = Flask(__name__)


@app.route('/')
def hello_world():
    return "Welcome to the 0A5 API"
