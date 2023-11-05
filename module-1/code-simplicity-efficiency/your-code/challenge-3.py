"""

For example, if you are given the number 15, there are 3 possibilities to compose right triangles:

1. [3, 4, 5]
2. [6, 8, 10]
3. [5, 12, 13]

The following function shows one way to solve the problem but the code is not ideal or efficient.
Refactor the code based on what you have learned about code simplicity and efficiency.


def my_function(X):
    solutions = []
    for x in range(5, X):
        for y in range(4, X):
            for z in range(3, X):
                if (x*x==y*y+z*z):
                    solutions.append([x, y, z])
    m = 0
    for solution in solutions:
        if m < max(solution):
            m = max(solution)
    return m

X = input("What is the maximal length of the triangle side? Enter a number: ")

print("The longest side possible is " + str(my_function(int(X))))
"""

def my_function(X):
    longest_side = 0
    for x in range(5, X):
        for y in range(4, X):
            for z in range(3, X):
                if x ** 2 == y ** 2 + z ** 2:
                    longest_side = max(longest_side, x)
    return longest_side

X = int(input("What is the maximal length of the triangle side? Enter a number: "))
longest_side = my_function(X)    
print("The longest side possible is: " + str(longest_side))


