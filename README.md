# Welcome to the class API!
We will be using this repo to create an API for our entire class. We will use Flask for this application and each member of the class will work within this single repo.

## How to install pip requirements

Make sure to run these commands before you run the Flask app. It will install all the requirements

```
pip install -r requirements.txt
```

## How to Test

Run 
```
pytest
``` 
or

```
ptw .
```

## How to run and get to your endpoint
To get to your endpoint go to the folder the app is in in a terminal (EX. class-api-IT4200-2024-fall) and run the following command:
```
python3 -m flask run
``` 
This will start the server. From there navigate to the url and your desired endpoint “http://127.0.0.1:5000/calc” for calculator for example. 

## Factorial Endpoint
Currently not working, needs to be rewritten -- if you want to ignore it (like I did), comment it out to run pytest lol

## How to use fruit_info Endpoint
Navigate to http://127.0.0.1:5000/fruitInfo?fruit=apple
Replace "apple" from the end of the url with the fruit of your choice.
If the fruit isn't available an error message will come up and you will be given a list of options.
Choose a fruit from the options given.

## How to Use the Calculator Endpoint

Use the following template to add, subtract, multiply, or divide two numbers: 
`http://127.0.0.1:5000/calc?x=<number>&y=<number>&op=<operator>`
- Replace `<number>` with the numbers you want to use.
- Replace `<operator>` with one of the following operations: `add`, `subtract`, `multiply`, `divide`.

### Important Notes:
- The operators must be spelled exactly as shown above, or you will receive an error.
- If any of the variables (`x`, `y`, or `op`) are missing, you will receive an error.



## how to use get motivation
The /motivation endpoint provides a random motivational quote whenever accessed via a GET request. When a user sends a request to this endpoint, the app responds with one of five pre-defined motivational quotes, returned in JSON format. This allows users to easily retrieve an encouraging message with every request, making it useful for applications or websites where inspiration or daily motivation is desired. Each request will randomly select and serve one quote from the list.

## How to use twoManaCombo Endpoint
Go to http://127.0.0.1:5000/twoManaCombos?color=your_color. Specifiy which color you want included in your deck by replacing it with your_color. If you don't want to specify, you can leave it blank. Then, get the combo name, and start building your next MTG deck! ⚪🔵⚫🔴🟢

## How to get to the stoic quotes Endpoint
Go to http://127.0.0.1:5000/quotes for a good random stoic quotes from Plato and others.

## How to use pizzaToppings Endpoint
Go to http://127.0.0.1:5000/pizzaToppings to finally decide what sauce and toppings to put on your pizza 🍕!
To test if the code is working properly run:
"python -m pytest ./test/test_toppings.py"

## How to use Dad Jokes Endpoint
Go to http://127.0.0.1:5000/dadjoke to laugh so hard you throw up! Now with even more hilarious Dad jokes!
To run tests to verify functionality of the dadjokes endpoint enter "python -m pytest ./test/test_dadjoke.py".

## How to use the Travel Randomizer Endpoint
Go to http://127.0.0.1:5000/travel to be given a randomly chosen travel destination! 
This app will output a popular travel destination in "city, country" JSON format.
To test functionality, run this script:
python3 -m pytest ./test/test_travel.py

## How to use Marathon Facts Endpoint
Go to http://127.0.0.1:5000/marathonFacts to learn a random fact about marathons! 
Use the template to return a hex code of the color you want "http://127.0.0.1:5000/color?color=blue"
Replace the "blue" at the end with any color of your choosing.
If the color doesn't exist in the library, you will get an error.

## How to use the Quotes Endpoint

Open up the url to http://127.0.0.1:5000/quotes
Start reading people's favorite quotes!

## How to Use the Favorite Quote Endpoint

To retrieve a favorite quote, navigate to:

http://127.0.0.1:5000/favoritequote

## How to use Color Hexifier endpoint

#### Get Items
- **Endpoint**: `/items`
- **Method**: `GET`
- **Description**: Returns a list of items. Optionally filter items by a minimum price.
- **Query Parameters**:
  - `min_price`: Filters items that have a price greater than or equal to the specified value (default is 0).


Use the template to return a hex code of the color you want "http://127.0.0.1:5000/color?color=blue"
Replace the "blue" at the end with any color of your choosing.
If the color doesn't exist in the library, you will get an error.

## How to use Fortune Cookie Endpoint

This API has a `/fortune` endpoint that returns a random fortune in JSON format.

# How to make an Endpoint
Go to http://127.0.0.1:5000/howToMakeEndpoint to learn how to make an endpoint.

## How to use the Random Fact Endpoint

To retrieve a random fact, navigate to http://127.0.0.1:5000/randomFact

## How to use the tennisFacts Endpoint

🎾 Go to http://127.0.0.1:5000/tennisFacts to learn fun facts about tennis!

You can retrieve tennis facts using the `/tennisFacts` endpoint.

## How to use the sportsFacts Endpoint

🏅 Go to http://127.0.0.1:5000/sports_fact to learn fun facts about various sports!

You can retrieve sports facts using the `/sports_fact` endpoint.

## How to use the Pokefishing Endpoint
Go to http://127.0.0.1:5000/pokefishing to catch a Magikarp!
```bash
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠟⠁⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⠟⠁⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡿⣦⣄⠀⣠⡾⠟⠁⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣇⠈⠛⢿⣟⠁⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠙⠷⠄⠀⠀⠀⠀⠀⠘⣿⢶⣶⣦⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⢈⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣾⡟⠛⢿⣷⣦⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⠿⠟⠛⠉⠉⠀⠀⠈⣇⠈⠉⠛⢿⠿⣶⣤⡀⠀⠀⠀⢀⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣴⡾⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣄⣀⣠⠞⠀⠀⠙⠻⣷⣤⣴⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣴⡿⠋⠀⠀⢀⣠⠤⠤⠤⣄⠀⠀⠀⠀⠀⢇⠀⠈⠳⣄⠀⠀⠀⠈⠙⢿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡶⠶⣿⣿⡿⣿⠟
⠀⣀⣴⣿⠋⠀⠀⠀⢰⠏⠀⠀⠀⠀⠈⢳⡀⠀⠀⠀⢸⠀⠀⢀⠎⠀⠀⠀⠀⠀⠈⡿⣷⡄⠀⠀⠀⠀⣀⣴⠟⢋⣡⡶⠛⠉⠀⢰⡏⠀
⢸⣟⠙⢧⡀⠀⠀⠀⣟⠀⠀⠀⠃⠀⠀⢰⠇⠀⠀⠀⠀⡗⠒⠣⡀⠀⠀⠀⠀⠀⠀⢱⠈⢿⣆⠀⢀⡼⠋⢀⡴⠟⠁⠀⠀⠀⠀⡿⠀⠀
⠀⠻⣦⡄⠘⡆⠀⠀⠻⣦⡀⠀⠀⣀⡴⠋⠀⠀⢀⣠⡴⠿⠶⠶⠿⢦⣤⣤⣤⣤⣀⣸⣄⠀⣻⣦⠟⠀⣴⣏⠤⠄⠒⠒⠒⠒⣾⠃⠀⠀
⠀⠀⢿⠺⠀⢱⠀⠀⠀⠈⠛⠛⠛⠉⠀⣀⡴⠞⠋⢁⠴⠒⠒⠊⣉⡉⠓⠒⠒⠒⣶⣿⡿⠛⠉⣿⢀⡾⠋⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀
⠀⠀⢸⣀⡇⢸⠀⠀⠀⠀⣠⣤⣀⠀⢸⠋⠀⢀⣴⠥⠒⠊⠉⠁⠀⠀⠀⢀⣴⠟⠉⢠⠃⠀⠀⠈⣾⠁⠀⠀⠀⠀⠀⠀⣴⠃⠀⠀⠀⠀
⠀⣠⣾⣫⠃⡜⠀⠀⠀⠀⠈⠳⣌⢳⡀⠀⢰⣟⠓⠢⠄⡀⠀⠀⠀⢀⣴⠟⠁⠀⠀⡸⠀⠀⠀⣸⡇⠀⠀⠀⠀⠀⠀⣸⠃⠀⠀⠀⠀⠀
⢰⢧⡟⠁⢠⣇⡀⠀⠀⠀⠀⠀⠸⡄⢷⠀⠀⠈⠛⢦⣀⠀⠀⠀⢠⡟⠁⠀⠀⠀⢀⠇⠀⢀⠜⣿⢧⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀
⡞⢸⠛⠒⠿⣷⣬⡓⠢⠤⣀⡀⠀⣇⠸⡆⠀⠀⠀⡾⠛⢷⣄⣰⡟⠀⠀⠀⠀⠀⣞⣠⡴⡟⠀⣿⠈⢆⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀
⢧⠸⡇⠀⠀⠈⠙⠿⣷⣶⣤⣈⡉⣿⠀⡧⠤⣀⣞⠁⠀⣀⠟⠟⠀⠀⠀⣀⣤⣾⠿⠋⠀⣿⠀⣿⠀⠈⠣⡀⠀⠀⢰⡏⠀⠀⠀⠀⠀⠀
⠘⣆⢳⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⡇⠀⣷⣶⣿⣤⣭⣭⣤⣴⣶⣶⡾⠿⠛⠉⠁⠀⠀⠀⠸⣇⢸⡇⠀⠀⠈⠢⣀⡾⠁⠀⠀⠀⠀⠀⠀
⠀⠹⣦⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⢸⡿⠃⠀⠀⠀⠀⠀⠀⠀⢻⣦⠀⠀⠀⠀⠀⠀⠀⠀⠹⣦⢿⡄⠀⠀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⣇⢧⠀⠀⠀⠀⠀⠀⠀⢰⠃⢸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣦⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣿⣦⣸⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠸⡎⢧⠀⠀⠀⠀⠀⢀⣾⡄⢸⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⢹⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢱⠸⡆⠀⠀⠀⠀⠘⠻⡇⢸⣤⡶⠟⢿⣤⡀⠀⣾⠿⣶⣤⣀⣻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⣤⡇⠀⠀⠀⠀⠀⠀⢻⡘⣇⠀⠀⠀⠙⠻⣶⡟⠀⠀⠉⠙⠛⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠈⢧⡙⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢰⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠑⢦⣽⣦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
```
## How to use the brainrot Endpoint
Go to http://127.0.0.1:5000/brainrot to add a new word to your vocabulary!

## How to use the convertToBinary Endpoint
Go to http://127.0.0.1:5000/convertToBinary?num=# and replace the # with any non-negative whole number! Don't even think about putting in floats, strings, or blanks. I have tested all of those cases and you will get appropriate responses for each!

## How to Rebase
 * step 1: STOP, just use merge thingy....

## Contributors:

* Laura Coulome
* Riker Evans
* Jace Barrett
* Donavan Franco
* Christian Bassilios
* Soren Bybee
* Keaton Hall
* Josh Beckstrand
* Dallin Hougaard
* Andres
* Travis Gunter
* Morgan Andrus
* Yomi Odubiyi
* Brayden Connole

## Welcome to The IT4200 Art Gallery!


*Only KOOL Kids Will Get This Reference....

![alt text](https://github.com/UTT-Connole/class-api-IT4200-2024-fall/blob/main/images/git%20hw%20edited.png)


```bash
⬛⬛⬛⬛⬛🟩🟩⬛🟩🟩⬛⬛⬛
⬛⬛⬛⬛🟩🟩🟩🟩🟩🟩🟩⬛⬛ 
⬛⬛⬛🟩🟩⬜⬛⬜⬜⬛🟩⬛⬛ 
⬛⬛⬛🟩🟩🟩🟩🟩🟩🟩⬛⬛⬛
⬛⬛🟩🟩🟩🟩🟫🟫🟫🟫⬛⬛⬛
⬛⬛🟩🟩🟩🟩🟩🟩🟩⬛⬛⬛⬛
Pepe after forcing to main....


Go Trailblazers! 🦬
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        *
       /O\
      /_O_\
     /O/_\O\
    /_O_|_O_\
   /O/_O_|_O_\
  /_O_|_O_|_O_\
 /O/_O_|_O_|_O_\
/_O_|_O_|_O_|_O_\
       |||
       |||
       |||
(;-;) lifu

```