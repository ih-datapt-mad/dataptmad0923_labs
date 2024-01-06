def longest_side_possible(X):
    max_side = 0
    for x in range(5, X):
        for y in range(4, x):
            z = (x**2 - y**2)**0.5
            if z.is_integer() and z < X:
                max_side = max(max_side, x)
    return max_side

X = int(input("What is the maximal length of the triangle side? Enter a number: "))
print("The longest side possible is", longest_side_possible(X))
