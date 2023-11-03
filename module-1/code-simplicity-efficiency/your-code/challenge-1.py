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
def get_integer_input(prompt, valid_range):
    while True:
        user_input = input(prompt)
        if user_input.isdigit() and int(user_input) in valid_range:
            return int(user_input)
        else:
            print("Invalid input. Please enter a valid integer from", valid_range)

valid_range = range(6)

a = get_integer_input('Please choose your first number (zero to five): ', valid_range)
b = input('What do you want to do? plus or minus: ')
c = get_integer_input('Please choose your second number (zero to five): ', valid_range)

if b not in ['plus', 'minus']:
    print("Invalid operation. Please enter 'plus' or 'minus'.")
else:
    if b == 'plus':
        result = a + c
    else:
        result = a - c

    print(f"{a} {b} {c} equals {result}")

print("Thanks for using this calculator, goodbye :)")
