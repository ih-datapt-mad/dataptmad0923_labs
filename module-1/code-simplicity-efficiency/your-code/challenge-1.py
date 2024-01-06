"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""
numbers_dict = {'zero':'0','one':'1','two':'2','three':'3','four':'4','five':'5','six': '6',
    'seven': '7',
    'eight': '8',
    'nine': '9',
    'ten': '10'
}

#PARA HACER LA PR
print('Welcome to this calculator!') #mensaje de bienvenida
print('It can add and subtract whole numbers from zero to five') #para que sirve este programa
a = input('Please choose your first number (zero to five): ') #primer input que pedimos al usuario
b = input('What do you want to do? plus or minus: ') #que quiere hacer restar o sumar?
c = input('Please choose your second number (zero to five): ') #segundo input para realizar la operación sobre el input a

result = None #creamos una variable para el resultado

if a in numbers_dict and c in numbers_dict and b in ['plus','minus']: #con esto verificamos que los input sean correctos y que la operación se pueda realizar
    a_value = int(numbers_dict[a]) #transformamos el valor del dicionario a integer
    c_value = int(numbers_dict[c])
    
    if b == 'plus':  #con este if hacemos que sume o reste en función del input plus or minus
        result = a_value + c_value
    else:
        result = a_value - c_value

    print(f"{a} {b} {c} equals {result}" if result in numbers_dict.values() else "Sorry, I can't calculate that.")
    #esto nos mostrara en pantalla el resultado de nuestro inputs o nos imprimira un mensaje si no ha podido calcularlo
else:
    print("I am not able to answer this question. Check your input.")   #aviso de que los inputs estan mal y que los revisemos

print("Thanks for using this calculator, goodbye :)") #mensaje de despedida
