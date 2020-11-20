import os

from flask import Flask
from flask_migrate import Migrate

migrate = Migrate()


def create_app(config_name='prod'):
    """
    Create Flask application.

    Args:
        config_name:  'prod' (default), 'dev', 'test'

    Returns:
        Flask application
    """
    app = Flask(__name__)

    # config_name = os.environ.get('APP_MODE', 'production')
    settings = 'app.config.Config'
    app.config.from_object(settings)

    from app.models import db
    db.init_app(app)
    migrate.init_app(app)

    from app.auth.views import bp as auth_bp
    app.register_blueprint(auth_bp, url_prefix='/auth')

    return app
