"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""
import random as rd

class IncorrectLengthsError(Exception):
    pass

def RandomStringGenerator(length=12, characters='abcdefghijklmnopqrstuvwxyz0123456789'):
    return ''.join(rd.choice(characters) for _ in range(length))

def BatchStringGenerator(num_strings, min_length=8, max_length=12):
    if min_length > max_length:
        raise IncorrectLengthsError('Incorrect min and max string lengths. Try again.')
    
    return [RandomStringGenerator(rd.randint(min_length, max_length)) for _ in range(num_strings)]

if __name__ == '__main__':
    a = int(input('Enter minimum string length: '))
    b = int(input('Enter maximum string length: '))
    n = int(input('How many random strings to generate? '))
    
    try:
        generated_strings = BatchStringGenerator(n, a, b)
        print(generated_strings)
    except IncorrectLengthsError as e:
        print(e)
