"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""
import random as rd
import sys

def randomstring(l=12, az = 'abcdefghijklmnopqrstuvwxyz0123456789'):
    return ''.join(rd.choice(az) for i in range(l))

def batchstring(n, a=8, b=12):
    if b < a:
        a, b = b, a
        print ('Min and max lenghts have been switched around to make sense')
    return [randomstring(rd.randint(a,b)) for i in range(n)]

a = int(input('Enter minimum string length: '))
b = int(input('Enter maximum string length: '))
n = int(input('How many random strings to generate? '))
print(batchstring(n,a,b))
