from datetime import datetime



dateFormatStr = '%d/%m/%Y'

class User:
    def __init__(self):
        self.name = "null"
        self.email = "null"
        self.phone = "null"
        self.gender = "null"
        self.date_of_birth = "null"
        # self.pass_hash = "null"

    def from_doc(self, doc):
        self.name = doc['name']
        self.email = doc['email']
        self.phone = doc['phone']
        self.gender = doc['gender']
        self.date_of_birth = doc['date_of_birth']
        # self.pass_hash = doc['pass_hash']
        self._id = str(doc['_id'])

    def from_json(self, doc):
        self.name = doc['name']
        self.email = doc['email']
        self.phone = doc['phone']
        self.gender = doc['gender']
        self.date_of_birth = datetime.strptime(doc['date_of_birth'], dateFormatStr)
        self.pass_hash = doc['pass_hash']
    


