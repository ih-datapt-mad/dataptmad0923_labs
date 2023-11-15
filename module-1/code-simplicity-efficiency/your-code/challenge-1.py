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
print('It can add and subtract any whole numbers')
a = int(input('Please choose your first number - It must be an integer: '))
b = int(input('Please choose your second number - It must be an integer: '))
c = int(input('Please, choose 1 if you want to ADD the number or 2 if you want to SUBSTRACT: '))


if isinstance(a, int) and isinstance(b, int) and c == 1:
    print(a + b)
elif isinstance(a, int) and isinstance(b, int) and c == 2:
    print(a - b)
elif isinstance(c, int) and (c != 1 or c != 2):
    print("Please introduce either 1 or 2 to add or substract the numbers")
else:
    print("The input must be an integer")

print("Thanks for using this calculator, goodbye :)")
