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
import math
from os import system

def hypotenuse(cat_a, cat_b):
    return math.sqrt(cat_a ** 2 + cat_b ** 2)

def right_triangle(max_length):
    length_counter = 0
    triangles = []

    for cat_a in range(3, max_length):
        for cat_b in range(cat_a, max_length):
            h = hypotenuse(cat_a, cat_b)
            if h.is_integer() and h > length_counter:
                length_counter = int(h)
                triangles.append((cat_a, cat_b, length_counter))                

    return triangles

while True:
    system("cls")
    max_length = int(input("What is the maximal length of the triangle side? Enter a number: "))
    print("The longest side possible is " + str(right_triangle(max_length)))
    input('To continue, press enter')