from flask import Blueprint

bp = Blueprint('auth', __name__)


@bp.route('/hello', methods=['GET'])
def hello():
    """Just say Hello."""
    return {"message": "Hello!"}
