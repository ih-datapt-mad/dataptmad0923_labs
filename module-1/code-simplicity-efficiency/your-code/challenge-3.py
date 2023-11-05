"""
You are presented with an integer number larger than 5. Your goal is to identify the longest side
possible in a right triangle whose sides are not longer than the number you are given.

For example, if you are given the number 15, there are 3 possibilities to compose right triangles:

1. [3, 4, 5]
2. [6, 8, 10]
3. [5, 12, 13]

The following function shows one way to solve the problem but the code is not ideal or efficient.
Refactor the code based on what you have learned about code simplicity and efficiency.
"""

def longest_side(x):    # X minúscula
    solutions = []     
    for i in range(5, x):            # Que no se llame igual que X 
        for y in range(4, x):
            for z in range(3, x):
                if i*i == y*y + z*z:     # Creo que los paréntesis no son necesarios
                    solutions.append([i, y, z])
    m = 0
    for solution in solutions:
        if m < max(solution):
            m = max(solution)
    return m

number = int(input("What is the maximal length of the triangle side? Enter a number: "))  # Lo incluyo como int

# El input debe ser mayor de 5
if number < 5:
    print('Please, the number must be greater than or equal to 5.')
else:
    result = str(longest_side(number))  # Guardo resultado como variable
    print(f"The longest side possible is: {result} ")

# print("The longest side possible is " + str(my_function(int(X))))
