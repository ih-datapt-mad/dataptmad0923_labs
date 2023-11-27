"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

import random

def RandomStringGenerator(pred_len=12, mixed_characters = None):
    lower_letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    numbers = ['0','1','2','3','4','5','6','7','8','9']

    if mixed_characters is None:
     mixed_characters = lower_letters + numbers

    str_generation_counter = 0 #p
    string = ''   #s
    while str_generation_counter < pred_len:
        string += random.choice(mixed_characters)
        str_generation_counter += 1
    return string

def BatchStringGenerator(number_of_strings, min_length=8, max_length=12):
    strings = [RandomStringGenerator(random.randint(min_length,max_length)) for i in range(number_of_strings)]
    return strings

min_length = input('Enter minimum string length: ')
max_length = input('Enter maximum string length: ')
number_of_strings = input('How many random strings to generate? ')

print(BatchStringGenerator(int(number_of_strings), int(min_length), int(max_length)))

"""def RandomStringGenerator(l=12, a=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']):
    p = 0
    s = ''
    while p<l:
        import random
        s += random.choice(a)
        p += 1
    return s

def BatchStringGenerator(n, a=8, b=12):
    r = []
    for i in range(n):
        c = None
        if a < b:
            import random
            c = random.choice(range(a, b))
        elif a == b:
            c = a
        else:
            import sys
            sys.exit('Incorrect min and max string lengths. Try again.')
        r.append(RandomStringGenerator(c))
    return r

a = input('Enter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')

print(BatchStringGenerator(int(n), int(a), int(b)))"""
