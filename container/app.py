#!/usr/bin/env python

import json
from datetime import datetime
from flask import Flask, jsonify

flask_app = Flask(__name__)


@flask_app.route("/")
def index():
    return jsonify(
        {
            "message": "Automate all the things!",
            "timestamp": int(datetime.now().strftime("%s")),
        }
    )


if __name__ == "__main__":
    flask_app.run(debug=True, host="0.0.0.0", port=3000)
