"""
The code below generates a given number of random strings that consists of numbers and 
lower case English letters. You can also define the range of the variable lengths of
the strings being generated.

The code is functional but has a lot of room for improvement. Use what you have learned
about simple and efficient code, refactor the code.
"""

# Saco los import fuera de las funciones
import random
# import sys  # Creo que esto ya no lo tengo que importar
import string  # Tengo que importar esta libreria parara el ascii_letters y digists


# Modifico las listas de caracteres
def RandomStringGenerator(l=12, caracteres=string.ascii_letters + string.digits):
# def RandomStringGenerator(l=12, a=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9']):
    p = 0
    s = ''
    while p<l:
        s += random.choice(caracteres)
        p += 1
    return s

def BatchStringGenerator(n, a=8, b=12):
    r = []
    for i in range(n):
        c = None
        # Resumo, si el mínimo es mayor o igual al máximo, dame un error, sino continua
        if a >= b: 
            # Dame un error 
            raise ValueError('Incorrect min and max string lengths. Try again.')
        else: 
            c = random.choice(range(a, b))
        r.append(RandomStringGenerator(c))
    return r

"""
        if a < b:
            c = random.choice(range(a, b))
        elif a == b:
            c = a
        else:
            sys.exit('Incorrect min and max string lengths. Try again.')
        
        r.append(RandomStringGenerator(c))
    return r
"""

# Incluyo ya en el input el int
a = int(input('Enter minimum string length: '))
b = int(input('Enter maximum string length: '))
n = int(input('How many random strings to generate? '))

# Guardo el resultado de la función en una variable y después muestro el resultado
result = BatchStringGenerator(n, a, b)
print(result)

# print(BatchStringGenerator(int(n), int(a), int(b)))
