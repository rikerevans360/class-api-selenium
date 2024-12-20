from flask import Blueprint, jsonify, request
import random, boto3, os
from botocore.exceptions import ClientError, EndpointConnectionError

mtg_bp = Blueprint('mtg', __name__)
dynamodb = boto3.resource('dynamodb', region_name='us-west-2', endpoint_url='http://localhost:8000')
table_name = "mana-combos"

def get_dynamodb_resource():
    dynamo_url = os.environ.get('DYNAMO_URL') or 'http://localhost:8000'
    dynamo_region = os.environ.get('DYNAMO_REGION') or 'us-west-2'
    print('dynamo_url:', dynamo_url)
    print('dynamo_region:', dynamo_region)

    # Check if DynamoDB is accessible locally
    try:
        dynamo = boto3.resource('dynamodb', endpoint_url=dynamo_url, region_name=dynamo_region)
        dynamo.meta.client.list_tables() 
        print("DynamoDB is running and accessible")
        return dynamo
    except EndpointConnectionError:
        print("DynamoDB is not running locally or the endpoint is unreachable.")
        return None  
    except ClientError as e:
        print(f"Client error while connecting to DynamoDB: {e}")
        return None
    except Exception as e:
        print(f"Unexpected error: {e}")
        return None

dynamodb = get_dynamodb_resource()

if dynamodb:
    print("Using DynamoDB resource")
else:
    print("Falling back to local data")
dynamodb = get_dynamodb_resource()

@mtg_bp.route('/twoManaCombos', methods=['GET'])
def random_combo():
    two_m =[{ "name": "Azorius", "color_1": "white", "color_2": "blue"},
            { "name": "Boros", "color_1": "red", "color_2": "white"},
            { "name": "Dimir", "color_1": "blue", "color_2": "black"},
            { "name": "Golgari", "color_1": "black", "color_2": "green"},
            { "name": "Gruul", "color_1": "red", "color_2": "green"},
            { "name": "Izzet", "color_1": "blue", "color_2": "red"},
            { "name": "Orzhov", "color_1": "white", "color_2": "black"},
            { "name": "Rakdos", "color_1": "black", "color_2": "red"},
            { "name": "Selesnya", "color_1": "white", "color_2": "green"},
            { "name": "Simic", "color_1": "blue", "color_2": "green"}]
    color = request.args.get('color')
    if color:
        filtered_combos = [combo for combo in two_m if color.lower() in [combo['color_1'].lower(), combo['color_2'].lower()]]
        if not filtered_combos:
            return jsonify({"error": "No combinations found for the given color"}), 404
        
        r = random.choice(filtered_combos)
    else:
        r = random.choice(two_m)
    return jsonify(r)

@mtg_bp.route('/MTGmana', methods=['GET'])
def mana_types():
    one = [{"Color": "white", "Known for": "order and protection"}, 
           {"Color": "blue", "Known for": "knowledge and control"}, 
           {"Color": "black", "Known for": "power and corruption"},
           {"Color": "red", "Known for": "chaos and passion"},
           {"Color": "green", "Known for": "growth and nature"},
        ]
    r = random.choice(one)
    return jsonify(r)