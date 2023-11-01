"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

# Las librerias deben ejecutarse de primero, dentro de las buenas prácticas

import random

# Variables globales después de las librerías

def random_strings(pred_len = 12, mixed_characters=None):

    lower_letters = ['a','b','c','d','e','f','g','h','i','j','k','l',
                     'm','n','o','p','q','r','s','t','u','v','w','x','y','z']
    
    numbers = ['0','1','2','3','4','5','6','7','8','9']

    capital_letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
                       'M', 'N', 'Ñ', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'X', 'Y', 'Z']

    symbols = ['*', '+', '-', '/', '@', '_', '?', '!', '[', '{', '(', ')', 
                  '}', ']', ',', ';', '.', '>', '<', '~', '°', '^', '&', '$', '#', '"'] 
                    

    if mixed_characters is None:
        mixed_characters = lower_letters + numbers + capital_letters + symbols

    str_generation_counter = 0

    string = ''

    while str_generation_counter < pred_len:        
        string += random.choice(mixed_characters)
        str_generation_counter += 1
    return string


def string_groups(number_of_strings, min_length=8, max_length=12):
    strings = [random_strings(random.randint(min_length, max_length)) for i in range(number_of_strings)]
    return strings

min_length = int(input('Enter minimum string length: '))
max_length = int(input('Enter maximum string length: '))
number_of_strings = int(input('How many random strings to generate? '))

print(string_groups(number_of_strings, min_length, max_length))