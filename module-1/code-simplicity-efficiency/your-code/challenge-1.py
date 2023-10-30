"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""

print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')
a = input('Please choose your first number (zero to five): ')
b = input('What do you want to do? plus or minus: ')
c = input('Please choose your second number (zero to five): ')

d1 = {'zero' : 0, 'one' : 1, 'two' : 2, 'three' : 3, 'four' : 4, 'five' : 5}
d3 = {0 : 'zero', 1 : 'one', 2 : 'two', 3: 'three', 4 : 'four', 5: 'five'}

if b == 'plus':
    print(f'{a} {b} {c} equals {d3[d1[a] + d1[c]]}')
if b == 'minus':
    print(f'{a} {b} {c} equals {d3[d1[a] - d1[c]]}') 

if (a not in d1.keys() or b not in ['plus', 'minus'] or c not in d1.keys()):
    print("I am not able to answer this question. Check your input.")

print("Thanks for using this calculator, goodbye :)")
