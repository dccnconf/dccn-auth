import os

from dotenv import load_dotenv

BASEDIR = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(BASEDIR, '..', '.env'))

POSTGRES_PASSWORD = os.environ['POSTGRES_PASSWORD']
POSTGRES_URL = f'postgresql://postgres:{POSTGRES_PASSWORD}@db'
DB_NAME = 'dccn_auth'


class Config:
    DEBUG = True
    SECRET_KEY = "no secret"
    SQLALCHEMY_DATABASE_URI = f'{POSTGRES_URL}/{DB_NAME}'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
