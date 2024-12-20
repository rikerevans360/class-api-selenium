#!/bin/bash

DYNAMODB_ENDPOINT="http://localhost:8000"

TABLE_NAME="test"
echo "Creating Table $TABLE_NAME"

aws dynamodb create-table \
    --table-name $TABLE_NAME \
    --attribute-definitions AttributeName=Id,AttributeType=S \
    --key-schema AttributeName=Id,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for table to be created..."
aws dynamodb wait table-exists --table-name $TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $TABLE_NAME created."
echo "Seeding data..."

aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "1"}, "Name": {"S": "John Doe"}, "Age": {"N": "30"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "2"}, "Name": {"S": "Jane Smith"}, "Age": {"N": "25"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "3"}, "Name": {"S": "Alice Johnson"}, "Age": {"N": "28"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

echo "Seeding completed for $TABLE_NAME."

# --------------------------
# Table for storing items data (for /items endpoint)
ITEMS_TABLE_NAME="items"
echo "Creating Table $ITEMS_TABLE_NAME"

aws dynamodb create-table \
    --table-name $ITEMS_TABLE_NAME \
    --attribute-definitions AttributeName=ID,AttributeType=S \
    --key-schema AttributeName=ID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for $ITEMS_TABLE_NAME to be created..."
aws dynamodb wait table-exists --table-name $ITEMS_TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $ITEMS_TABLE_NAME created."
echo "Seeding data for items table..."

# Insert items data
aws dynamodb put-item \
    --table-name $ITEMS_TABLE_NAME \
    --item '{"ID": {"S": "1"}, "Name": {"S": "Item One"}, "Description": {"S": "A sample item."}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $ITEMS_TABLE_NAME \
    --item '{"ID": {"S": "2"}, "Name": {"S": "Item Two"}, "Description": {"S": "Another sample item."}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $ITEMS_TABLE_NAME \
    --item '{"ID": {"S": "3"}, "Name": {"S": "Item Three"}, "Description": {"S": "Yet another item."}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

# --------------------------
# Table for storing names data (for /generateName endpoint)
NAMES_TABLE_NAME="names"
echo "Creating Table $NAMES_TABLE_NAME"

aws dynamodb create-table \
    --table-name $NAMES_TABLE_NAME \
    --attribute-definitions AttributeName=gender,AttributeType=S AttributeName=name,AttributeType=S \
    --key-schema AttributeName=gender,KeyType=HASH AttributeName=name,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for $NAMES_TABLE_NAME to be created..."
aws dynamodb wait table-exists --table-name $NAMES_TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $NAMES_TABLE_NAME created."
echo "Seeding data for names table..."

# Insert names data
aws dynamodb put-item \
    --table-name $NAMES_TABLE_NAME \
    --item '{"gender": {"S": "male"}, "name": {"S": "John"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $NAMES_TABLE_NAME \
    --item '{"gender": {"S": "female"}, "name": {"S": "Jane"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $NAMES_TABLE_NAME \
    --item '{"gender": {"S": "male"}, "name": {"S": "Michael"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

echo "Seeding completed for $NAMES_TABLE_NAME."

# --------------------------
# Pokefishing endpoint table
TABLE_NAME="pokefishing"
echo "Creating Table $TABLE_NAME"

aws dynamodb create-table \
    --table-name $TABLE_NAME \
    --attribute-definitions AttributeName=Id,AttributeType=S \
    --key-schema AttributeName=Id,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for table to be created..."
aws dynamodb wait table-exists --table-name $TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $TABLE_NAME created."
echo "Seeding data..."

aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "1"}, "catch": {"S": "a regular ol' Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "2"}, "catch": {"S": "a calico pattern Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2
    
aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "3"}, "catch": {"S": "a orange two-tone pattern Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2
    
aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "4"}, "catch": {"S": "a pink dapple pattern Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "5"}, "catch": {"S": "a gray diamond pattern Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "6"}, "catch": {"S": "a purple patches pattern Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "7"}, "catch": {"S": "a apricot tiger pattern Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "8"}, "catch": {"S": "a brown stripes pattern Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2
    
aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "9"}, "catch": {"S": "a orange forehead pattern Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "10"}, "catch": {"S": "a blue raindrops pattern Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2
    
aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "11"}, "catch": {"S": "a shiny Magikarp"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2
    
aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "12"}, "catch": {"S": "a... Oh no, it'\''s a Gyarados!!"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2
    
aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "13"}, "catch": {"S": "a Goldeen and it'\''s the biggest you'\''ve ever seen"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2
    
aws dynamodb put-item \
    --table-name $TABLE_NAME \
    --item '{"Id": {"S": "14"}, "catch": {"S": "nothing... But you did see a Mudkip riding on a Lotad"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

echo "Seeding completed for $TABLE_NAME."
    
# --------------------------
# Table for storing travel data (for /travel endpoint)
TRAVEL_TABLE_NAME="travel"
echo "Creating Table $TRAVEL_TABLE_NAME"

aws dynamodb create-table \
    --table-name $TRAVEL_TABLE_NAME \
    --attribute-definitions AttributeName=ID,AttributeType=S \
    --key-schema AttributeName=ID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for $TRAVEL_TABLE_NAME to be created..."
aws dynamodb wait table-exists --table-name $TRAVEL_TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $TRAVEL_TABLE_NAME created."
echo "Seeding data for travel table..."

# Insert all travel data items
aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "1"}, "destination": {"S": "Paris, France"}, "duration": {"S": "9h 50m"}, "continent": {"S": "Europe"}, "best_season": {"S": "Spring"}}' \

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "2"}, "destination": {"S": "Rome, Italy"}, "duration": {"S": "13hr 30m"}, "continent": {"S": "Europe"}, "best_season": {"S": "Summer"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "3"}, "destination": {"S": "London, England"}, "duration": {"S": "9hr 30m"}, "continent": {"S": "Europe"}, "best_season": {"S": "Fall"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "4"}, "destination": {"S": "Tokyo, Japan"}, "duration": {"S": "13hr 40m"}, "continent": {"S": "Asia"}, "best_season": {"S": "Spring"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "5"}, "destination": {"S": "Barcelona, Spain"}, "duration": {"S": "12hr 30m"}, "continent": {"S": "Europe"}, "best_season": {"S": "Spring"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "6"}, "destination": {"S": "New York City, New York"}, "duration": {"S": "4hr 35m"}, "continent": {"S": "North America"}, "best_season": {"S": "Winter"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "7"}, "destination": {"S": "Los Angeles, California"}, "duration": {"S": "2hr"}, "continent": {"S": "North America"}, "best_season": {"S": "Fall"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "8"}, "destination": {"S": "Dublin, Ireland"}, "duration": {"S": "11hr 30m"}, "continent": {"S": "Europe"}, "best_season": {"S": "Fall"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "9"}, "destination": {"S": "Cairo, Egypt"}, "duration": {"S": "15hr 15m"}, "continent": {"S": "Africa"}, "best_season": {"S": "Winter"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "10"}, "destination": {"S": "Sydney, Australia"}, "duration": {"S": "18hr 15m"}, "continent": {"S": "Australia"}, "best_season": {"S": "Summer"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "11"}, "destination": {"S": "Sacramento, California"}, "duration": {"S": "1hr 45m"}, "continent": {"S": "North America"}, "best_season": {"S": "Spring"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "12"}, "destination": {"S": "Salt Lake, Utah"}, "duration": {"S": "0hr 0m"}, "continent": {"S": "North America"}, "best_season": {"S": "Anytime"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "13"}, "destination": {"S": "Denver, Colorado"}, "duration": {"S": "1hr 35m"}, "continent": {"S": "North America"}, "best_season": {"S": "Summer"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $TRAVEL_TABLE_NAME \
    --item '{"ID": {"S": "14"}, "destination": {"S": "Santa Cruz, California"}, "duration": {"S": "2hr"}, "continent": {"S": "North America"}, "best_season": {"S": "Fall"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

echo "Seeding completed for $TRAVEL_TABLE_NAME."

# --------------------------
# Table for storing fortunes (for /fortune endpoint)
FORTUNE_TABLE_NAME="fortunes"
echo "Creating Table $FORTUNE_TABLE_NAME"

aws dynamodb create-table \
    --table-name $FORTUNE_TABLE_NAME \
    --attribute-definitions AttributeName=ID,AttributeType=S \
    --key-schema AttributeName=ID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for $FORTUNE_TABLE_NAME to be created..."
aws dynamodb wait table-exists --table-name $FORTUNE_TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $FORTUNE_TABLE_NAME created."
echo "Seeding data for fortune table..."

# Insert fortune data
aws dynamodb put-item \
    --table-name $FORTUNE_TABLE_NAME \
    --item '{"ID": {"S": "1"}, "fortune": {"S": "You will find a fortune."}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $FORTUNE_TABLE_NAME \
    --item '{"ID": {"S": "2"}, "fortune": {"S": "A fresh start will put you on your way."}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $FORTUNE_TABLE_NAME \
    --item '{"ID": {"S": "3"}, "fortune": {"S": "Fortune favors the brave."}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $FORTUNE_TABLE_NAME \
    --item '{"ID": {"S": "4"}, "fortune": {"S": "Good news will come to you by mail."}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $FORTUNE_TABLE_NAME \
    --item '{"ID": {"S": "5"}, "fortune": {"S": "A beautiful, smart, and loving person will be coming into your life."}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $FORTUNE_TABLE_NAME \
    --item '{"ID": {"S": "6"}, "fortune": {"S": "A soft voice may be awfully persuasive."}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2

aws dynamodb put-item \
    --table-name $FORTUNE_TABLE_NAME \
    --item '{"ID": {"S": "7"}, "fortune": {"S": "All your hard work will soon pay off."}}' \
    --endpoint-url $DYNAMODB_ENDPOINT \
    --region us-west-2


echo "Seeding completed for $NAMES_TABLE_NAME."

# Table for storing meals data (for /meal/<meal_id> endpoint)
MEALS_TABLE_NAME="meals"
echo "Creating Table $MEALS_TABLE_NAME"

aws dynamodb create-table \
    --table-name $MEALS_TABLE_NAME \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --key-schema AttributeName=id,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for $MEALS_TABLE_NAME to be created..."
aws dynamodb wait table-exists --table-name $MEALS_TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $MEALS_TABLE_NAME created."
echo "Seeding data for meals table..."

# --------------------------
# Insert meals data
aws dynamodb put-item \
    --table-name $MEALS_TABLE_NAME \
    --item '{"id": {"S": "1"}, "name": {"S": "Classic Meal"}, "pizza": {"S": "Pepperoni"}, "soda": {"S": "Coca Cola"}, "size": {"S": "2 Liter"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name $MEALS_TABLE_NAME \
    --item '{"id": {"S": "2"}, "name": {"S": "Vegan Meal"}, "pizza": {"S": "Vegan"}, "soda": {"S": "Sprite"}, "size": {"S": "Personal"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name $MEALS_TABLE_NAME \
    --item '{"id": {"S": "3"}, "name": {"S": "Family Meal"}, "pizza": {"S": "Cheese"}, "soda": {"S": "Mountain Dew"}, "size": {"S": "2 Liter"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Seeding completed for $MEALS_TABLE_NAME."

# Table for storing books data (for /books endpoint)
BOOKS_TABLE_NAME="books"
echo "Creating Table $BOOKS_TABLE_NAME"

aws dynamodb create-table \
    --table-name $BOOKS_TABLE_NAME \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --key-schema AttributeName=id,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for $BOOKS_TABLE_NAME to be created..."
aws dynamodb wait table-exists --table-name $BOOKS_TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $BOOKS_TABLE_NAME created."
echo "Seeding data for books table..."
aws dynamodb put-item \
    --table-name $BOOKS_TABLE_NAME \
    --item '{"id": {"S": "1"}, "title": {"S": "Clean Code"}, "author": {"S": "Robert Martin"}, "genre": {"S": "Programming"}, "year": {"N": "2008"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name $BOOKS_TABLE_NAME \
    --item '{"id": {"S": "2"}, "title": {"S": "Design Patterns"}, "author": {"S": "Gang of Four"}, "genre": {"S": "Programming"}, "year": {"N": "1994"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name $BOOKS_TABLE_NAME \
    --item '{"id": {"S": "3"}, "title": {"S": "The Pragmatic Programmer"}, "author": {"S": "Andy Hunt"}, "genre": {"S": "Programming"}, "year": {"N": "1999"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Seeding completed for $BOOKS_TABLE_NAME."

# Table for storing cryptocurrency prices
CRYPTO_TABLE_NAME="crypto_prices"
echo "Creating Table $CRYPTO_TABLE_NAME"

aws dynamodb create-table \
    --table-name $CRYPTO_TABLE_NAME \
    --attribute-definitions AttributeName=crypto,AttributeType=S \
    --key-schema AttributeName=crypto,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for $CRYPTO_TABLE_NAME to be created..."
aws dynamodb wait table-exists --table-name $CRYPTO_TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $CRYPTO_TABLE_NAME created."
echo "Seeding data for $CRYPTO_TABLE_NAME table..."

# Insert mock data for cryptocurrency prices
aws dynamodb put-item \
    --table-name $CRYPTO_TABLE_NAME \
    --item '{"crypto": {"S": "bitcoin"}, "price": {"S": "50000.00"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name $CRYPTO_TABLE_NAME \
    --item '{"crypto": {"S": "ethereum"}, "price": {"S": "4000.00"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name $CRYPTO_TABLE_NAME \
    --item '{"crypto": {"S": "solana"}, "price": {"S": "200.00"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name $CRYPTO_TABLE_NAME \
    --item '{"crypto": {"S": "cardano"}, "price": {"S": "1.50"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name $CRYPTO_TABLE_NAME \
    --item '{"crypto": {"S": "monero"}, "price": {"S": "300.00"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Seeding completed for $CRYPTO_TABLE_NAME."

# MTG Mana combos
TWO_MANA_TABLE_NAME="two_mana_combos"
echo "Creating Table $TWO_MANA_TABLE_NAME"

aws dynamodb create-table \
    --table-name $TWO_MANA_TABLE_NAME \
    --attribute-definitions AttributeName=ID,AttributeType=S \
    --key-schema AttributeName=ID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for $TWO_MANA_TABLE_NAME to be created..."
aws dynamodb wait table-exists --table-name $TWO_MANA_TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $TWO_MANA_TABLE_NAME created."
#seed --------------------------
echo "Seeding data for two_mana_combos table..."

aws dynamodb put-item \
    --table-name two_mana_combos \
    --item '{"ID": {"S": "1"}, "Name": {"S": "Azorius"}, "Color_1": {"S": "White"}, "Color_2": {"S": "Blue"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name two_mana_combos \
    --item '{"ID": {"S": "2"}, "Name": {"S": "Dimir"}, "Color_1": {"S": "Blue"}, "Color_2": {"S": "Black"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name two_mana_combos \
    --item '{"ID": {"S": "3"}, "Name": {"S": "Rakdos"}, "Color_1": {"S": "Black"}, "Color_2": {"S": "Red"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name two_mana_combos \
    --item '{"ID": {"S": "4"}, "Name": {"S": "Gruul"}, "Color_1": {"S": "Red"}, "Color_2": {"S": "Green"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name two_mana_combos \
    --item '{"ID": {"S": "5"}, "Name": {"S": "Selesnya"}, "Color_1": {"S": "Green"}, "Color_2": {"S": "White"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name two_mana_combos \
    --item '{"ID": {"S": "6"}, "Name": {"S": "Orzhov"}, "Color_1": {"S": "White"}, "Color_2": {"S": "Black"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name two_mana_combos \
    --item '{"ID": {"S": "7"}, "Name": {"S": "Izzet"}, "Color_1": {"S": "Blue"}, "Color_2": {"S": "Red"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name two_mana_combos \
    --item '{"ID": {"S": "8"}, "Name": {"S": "Golgari"}, "Color_1": {"S": "Black"}, "Color_2": {"S": "Green"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name two_mana_combos \
    --item '{"ID": {"S": "9"}, "Name": {"S": "Boros"}, "Color_1": {"S": "Red"}, "Color_2": {"S": "White"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name two_mana_combos \
    --item '{"ID": {"S": "10"}, "Name": {"S": "Simic"}, "Color_1": {"S": "Green"}, "Color_2": {"S": "Blue"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Seeding completed for two_mana_combos table."


#mana types
MANA_TYPES_TABLE_NAME="mana_types"
echo "Creating Table $MANA_TYPES_TABLE_NAME"

aws dynamodb create-table \
    --table-name $MANA_TYPES_TABLE_NAME \
    --attribute-definitions AttributeName=ID,AttributeType=S \
    --key-schema AttributeName=ID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Waiting for $MANA_TYPES_TABLE_NAME to be created..."
aws dynamodb wait table-exists --table-name $MANA_TYPES_TABLE_NAME --endpoint-url $DYNAMODB_ENDPOINT

echo "Table $MANA_TYPES_TABLE_NAME created."
#seed -----------------------
echo "Seeding data for mana_types table..."

aws dynamodb put-item \
    --table-name mana_types \
    --item '{"ID": {"S": "1"}, "Color": {"S": "White"}, "Trait": {"S": "Order and protection"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name mana_types \
    --item '{"ID": {"S": "2"}, "Color": {"S": "Blue"}, "Trait": {"S": "Knowledge and control"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name mana_types \
    --item '{"ID": {"S": "3"}, "Color": {"S": "Black"}, "Trait": {"S": "Ambition and power"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name mana_types \
    --item '{"ID": {"S": "4"}, "Color": {"S": "Red"}, "Trait": {"S": "Freedom and chaos"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

aws dynamodb put-item \
    --table-name mana_types \
    --item '{"ID": {"S": "5"}, "Color": {"S": "Green"}, "Trait": {"S": "Growth and harmony"}}' \
    --endpoint-url $DYNAMODB_ENDPOINT

echo "Seeding completed for mana_types table."
