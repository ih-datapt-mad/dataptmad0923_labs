import random
import string

def generate_strings(n, min_len=8, max_len=12):
    return [''.join(random.choices(string.ascii_lowercase + string.digits, k=random.randint(min_len, max_len))) for _ in range(n)]

min_length = int(input('Enter minimum string length: '))
max_length = int(input('Enter maximum string length: '))
num_strings = int(input('How many random strings to generate? '))

print(generate_strings(num_strings, min_length, max_length))