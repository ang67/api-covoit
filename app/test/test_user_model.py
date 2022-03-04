import unittest
import datetime

from app.main import db
from app.main.model.user import User
from app.test.base import BaseTestCase

import uuid
import re

class TestUserModel(BaseTestCase):

    def test_encode_auth_token(self):
        user = User(
            public_id=str(uuid.uuid4()),
            email='test@test.com',
            firstname='Toto',
            lastname='Titi',
            registered_on=datetime.datetime.utcnow(),
            password='pass'
        )
        db.session.add(user)
        db.session.commit()
        
        auth_token = user.encode_auth_token(user.id)
        self.assertTrue(re.match(r'[a-zA-Z0-9]+\.[a-zA-Z0-9]+\.[a-zA-Z0-9]+', auth_token))

    def test_decode_auth_token(self):
        user = User(
            public_id=str(uuid.uuid4()),
            email='test@test.com',
            firstname='Toto',
            lastname='Titi',
            registered_on=datetime.datetime.utcnow(),
            password='pass'
        )
        db.session.add(user)
        db.session.commit()
        auth_token = user.encode_auth_token(user.id)
        self.assertTrue(re.match(r'[a-zA-Z0-9]+\.[a-zA-Z0-9]+\.[a-zA-Z0-9]+', auth_token))
        self.assertTrue(User.decode_auth_token(auth_token) == 1)


if __name__ == '__main__':
    unittest.main()