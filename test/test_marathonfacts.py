def test_status_code(client):
    # Check if the status code is 200 OK
    response = client.get('/marathonFacts')
    assert response.status_code == 200

def test_data_pull(client):
    # Predefined facts from the blueprint
    facts = [
        {"fact": "The first marathon was in 1896 during the Athens Olympics.", "category": "history"},
        {"fact": "The official marathon distance is 26.2 miles (42.195 km).", "category": "distance"},
        {"fact": "The fastest marathon time for men is 2:01:39.", "category": "records"},
        {"fact": "The fastest marathon time for women is 2:14:04.", "category": "records"},
        {"fact": "Eliud Kipchoge ran a marathon in under 2 hours in a special event.", "category": "milestones"},
        {"fact": "Over 50,000 runners finish the New York City Marathon each year.", "category": "participation"}
    ]
    
    # Perform GET request to /marathonFacts
    response = client.get('/marathonFacts')
    
    # Parse the JSON response
    response_data = response.get_json()
    
    # Check if the response contains a valid fact from the predefined list
    assert response_data in facts