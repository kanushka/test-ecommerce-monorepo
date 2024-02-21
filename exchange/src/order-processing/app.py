import os
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/health', methods=['GET'])
def health_check():
    return jsonify(status='OK', message='Order processing service is running'), 200

@app.route('/new-order', methods=['POST'])
def new_order():
    # todo: create new order
    order = {
        'id': "2001",
        'status': "CREATED",
        'items': [
            {'productId': 1, 'quantity': 2},
            {'productId': 3, 'quantity': 1}
        ],
    }
    return jsonify(order=order, message='Order created successfully'), 201

if __name__ == '__main__':
    port = int(os.getenv('PORT', 7013))
    app.run(port=port)
