print("Welcome. This calculator can add or substract numbers from 0 to 5.")

a = int(input('Please choose your first number (0 to 5): '))
b = input('What do you want to do? plus (+) or minus (-) : ')
c = int(input('Please choose your second number (0 to 5): '))

if (a < 0 or a > 5) or (c < 0 or c > 5):
    print("Not a valid input. Please, try again with numbers between 0 and 5")
elif b == "+": print(f"{a} + {c} = {a + c}")
elif b == "-": print(f"{a} - {c} = {a - c}")
else: print("Not a valid operation. Choose either + or -")
    
print("Thanks for using this calculator, goodbye! :)")