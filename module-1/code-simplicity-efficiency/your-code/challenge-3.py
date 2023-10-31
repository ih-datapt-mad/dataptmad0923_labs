def triangle(max_len):
    solution = [[x,y,z] for z in range(3, max_len) for y in range(4, max_len) for x in range(5, max_len) if (x * x == y*y+z*z)]
    m = 0
    for s in solution:
        if m < max(s):
            m = max(s)
    return m
max_len = int(input("What is the maximal length of the triange side? "))
print(f"The longest length possible for a side of this triange is {triangle(max_len)}")

