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
#Utilizamos un try/except por si el usuario mete un string y le pedimos en el except que meta un numero.
try:
    #num1 convierte el numero del usuario a float
    num1 = float(input('Please choose your first number: '))
    # Definimos el operador de la calculadora
    operador = input('What do you want to do? plus(+), subtract(-):, multiplication(*):, divide(/): ')
    #num2 convierte el numero del usuario a float
    num2 = float(input('Please choose your second number: '))

    if operador == 'plus' or operador == '+':
        solution = num1 + num2
        #Si el operador es +, suma num1 y num2
    elif operador == 'subtract' or operador == '-':
        solution = num1 - num2
        #Si el operador es -, resta num1 y num2
    elif operador == 'multiplication' or operador == '*':
        solution = num1 * num2 
    elif operador == 'divide' or operador == '/':
        solution = num1 / num2

    else:
        print("I am not able to answer this question. Check your input.")
    print('The result is:', solution)
    #impirme la solucion
    print("Thanks for using this calculator, goodbye :)")
except ValueError:
    print("Please enter a number. Ex: 2")
except:
    print("Please check your input")
