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
############ MY SOLUTION ############
#FUNCTION MAX_TRIANGLE_SIDES: calculates the largest side from a list with the diferent of right triangle posibilities. 
#Input: maximal length of the triangle side, that it should be higher than 5 | Output: the longest side possible
def max_triangle_sides(max_len):
    #This function use a comprehension list to obtain a list with the diferent triangle posibilites. In each loop cycles through the different options up to the maximum length entered 
    #in the input. Each triangle obtained must meet the condition indicated in the if loop in order to be stored in the list. 
    triangle_sides = [[x, y, z]  
                      for x in range(5, max_len)  
                      for y in range(4, max_len)  
                      for z in range(3, max_len)  
                      if (x*x==y*y+z*z)]
    #With this other list comprehension, calculate the max of the sides for each triangle. And out of the list comprehension it calculates the max of each of the values calculated 
    #above and returns it.
    return max([max(triangle) for triangle in triangle_sides])

max_len = input("\nWhat is the maximal length of the triangle side? Enter a number: ")
print("The longest side possible is " + str(max_triangle_sides(int(max_len))), '\n')

'''
############ INITIAL SOLUTION ############
def my_function(X):
    solutions = []
    for x in range(5, X):
        print('-----Print x: ',x)
        for y in range(4, X):
            print('Print y: ',y)
            for z in range(3, X):
                print('Print z: ',z)
                if (x*x==y*y+z*z):
                    solutions.append([x, y, z])
                    print('>>>>>>Solution: ', solutions)
    m = 0
    for solution in solutions:
        if m < max(solution):
            m = max(solution)
    return m

X = input("\nWhat is the maximal length of the triangle side? Enter a number: ")

print("The longest side possible is " + str(my_function2(int(X))), '\n')
'''