import random
import string

def randomstring(min_len, max_len, num_strings):
    strings = []
    letters = string.ascii_lowercase
    numbers = "".join([str(x) for x in range(1, max_len)])
    numbers_letters = letters + numbers
    
    for i in range(num_strings):
        string_length = random.randint(min_len, max_len)
        random_string = "".join(random.choice(numbers_letters) for i in range(string_length))
        strings.append(random_string)
    return strings
    
min_len = int(input("Enter minimum string length: "))
max_len = int(input("Enter maximum string length: "))
num_strings = int(input("How many strings do you want? "))

randomstring(min_len, max_len, num_strings)