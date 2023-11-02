"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""
############ my SOLUTION ############
import random
import string

#FUNCTION RANDOM STRING: it's possible to obtain a random string with lowercase letters and numbers by entering the length of the string in the input. 
#Input: length of random string | Output: random string.
def RandomStringGenerator(str_len):
    str_random = ''   #Create a empty variable to store the string.
    characters = string.ascii_lowercase + string.digits  #Store in characters the lowercase letters and number, using 'ascii_lowercase' and 'digits' methods.
    for i in range(str_len):   #The loop is executed as many times as the length of the string.
        str_random += random.choice(characters)   #Each time it accesses the loop, it selects a letter or a number at random and stores it in 'str_random'.
    return str_random

#FUNCTION BATCH STRING RANDOMS: using the above function, it is possible to create the number of strings indicated in the function input, with random characters.
#Input: number of strings, minimun string length and maximun string length | Output: list with random string.
def BatchStringGenerator(n, a, b):
    string_list = []   #Create an empty list.
    for j in range(n):   #The loop is executed as many times as chains are to be generated.
        string_list.append(RandomStringGenerator(random.choice(range(a, b))))   #Execute the function above and the input of this function it's a random number beetween a and b
    return string_list

#CODE: write the inputs, execute the functions and print the result
a = input('\nEnter minimum string length: ')
b = input('Enter maximum string length: ')
n = input('How many random strings to generate? ')

print(BatchStringGenerator(int(n), int(a), int(b)), '\n')

'''
############ INITIAL SOLUTION ############
def RandomStringGenerator(l=12, a=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']):
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

print(BatchStringGenerator(int(n), int(a), int(b)))
'''