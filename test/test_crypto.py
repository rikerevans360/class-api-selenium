import pytest
from unittest.mock import patch
from flask import Flask
from endpoints.crypto import bitcoin_bp


@pytest.fixture
def client():
    """Fixture for creating a test client."""
    from app import app
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client


def test_bitcoin_price(client):
    """Test the '/bitcoin_price' endpoint for successful response."""
    with patch("endpoints.crypto.fetch_price_from_api") as mock_fetch, \
         patch("endpoints.crypto.get_last_price") as mock_last_price, \
         patch("endpoints.crypto.save_price_to_dynamo"):

        mock_fetch.return_value = "34250.87"
        mock_last_price.return_value = None

        response = client.get('/api/bitcoin_price')
        assert response.status_code == 200
        assert response.is_json
        json_data = response.json
        assert json_data["status"] == "success"
        assert json_data["current_price_usd"] == "34250.87"
        assert json_data["last_saved_price_usd"] is None


def test_bitcoin_price_response_format(client):
    """Test that '/bitcoin_price' endpoint returns the expected response format."""
    with patch("endpoints.crypto.fetch_price_from_api") as mock_fetch, \
         patch("endpoints.crypto.get_last_price") as mock_last_price, \
         patch("endpoints.crypto.save_price_to_dynamo"):

        mock_fetch.return_value = "34250.87"
        mock_last_price.return_value = "34200.00"

        response = client.get('/api/bitcoin_price')
        assert response.status_code == 200
        assert response.is_json
        json_data = response.json

        # Validate response structure and types
        assert "status" in json_data
        assert json_data["status"] == "success"
        assert "current_price_usd" in json_data
        assert isinstance(json_data["current_price_usd"], str)
        assert json_data["current_price_usd"] == "34250.87"
        assert "last_saved_price_usd" in json_data
        assert isinstance(json_data["last_saved_price_usd"], str)
        assert json_data["last_saved_price_usd"] == "34200.00"


def test_ethereum_price(client):
    """Test the '/ethereum_price' endpoint for successful response."""
    with patch("endpoints.crypto.fetch_price_from_api") as mock_fetch, \
         patch("endpoints.crypto.get_last_price") as mock_last_price, \
         patch("endpoints.crypto.save_price_to_dynamo"):

        mock_fetch.return_value = "2100.00"
        mock_last_price.return_value = "2000.00"

        response = client.get('/api/ethereum_price')
        assert response.status_code == 200
        assert response.is_json
        json_data = response.json
        assert json_data["status"] == "success"
        assert json_data["current_price_usd"] == "2100.00"
        assert json_data["last_saved_price_usd"] == "2000.00"


def test_solana_price(client):
    """Test the '/solana_price' endpoint for successful response."""
    with patch("endpoints.crypto.fetch_price_from_api") as mock_fetch, \
         patch("endpoints.crypto.get_last_price") as mock_last_price, \
         patch("endpoints.crypto.save_price_to_dynamo"):

        mock_fetch.return_value = "30.00"
        mock_last_price.return_value = None

        response = client.get('/api/solana_price')
        assert response.status_code == 200
        assert response.is_json
        json_data = response.json
        assert json_data["status"] == "success"
        assert json_data["current_price_usd"] == "30.00"
        assert json_data["last_saved_price_usd"] is None


def test_unsupported_cryptocurrency(client):
    """Test the behavior when an unsupported cryptocurrency is requested."""
    response = client.get('/api/unsupported_crypto_price')
    assert response.status_code == 400
    assert response.is_json
    json_data = response.json
    assert json_data["status"] == "error"
    assert json_data["message"] == "Unsupported cryptocurrency"


def test_api_failure_with_fallback(client):
    """Test that the fallback to the last saved price works when the API fails."""
    with patch("endpoints.crypto.fetch_price_from_api") as mock_fetch, \
         patch("endpoints.crypto.get_last_price") as mock_last_price:

        mock_fetch.side_effect = Exception("API failure")
        mock_last_price.return_value = "33000.00"

        response = client.get('/api/bitcoin_price')
        assert response.status_code == 200
        assert response.is_json
        json_data = response.json
        assert json_data["status"] == "success"
        assert json_data["current_price_usd"] == "33000.00"
        assert "Fetched last saved price as API call failed" in json_data["message"]


def test_empty_dynamodb_response(client):
    """Test that the endpoint handles empty DynamoDB responses gracefully."""
    with patch("endpoints.crypto.get_last_price") as mock_last_price, \
         patch("endpoints.crypto.fetch_price_from_api") as mock_fetch:

        mock_last_price.return_value = None
        mock_fetch.side_effect = Exception("API failure")

        response = client.get('/api/bitcoin_price')
        assert response.status_code == 500
        assert response.is_json
        json_data = response.json
        assert json_data["status"] == "error"
        assert "API call failed and no saved data available" in json_data["message"]
