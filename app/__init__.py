from flask import Flask
from flask_migrate import Migrate

migrate = Migrate()


def create_app(config_name=None):
    app = Flask(__name__)

    settings = 'app.config.Config'
    app.config.from_object(settings)

    from app.models import db
    db.init_app(app)
    migrate.init_app(app)

    from app.auth.views import bp as auth_bp
    app.register_blueprint(auth_bp, url_prefix='/auth')

    return app
