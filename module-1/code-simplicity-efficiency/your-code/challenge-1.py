from os import system

# Dicts for number to text:
number_to_text = {0: 'zero', 1: 'one', 2: 'two', 3: 'three', 4: 'four', 5: 'five'}

# Dicts for sums greater than 5:
plus_result = {6: 'six', 7: 'seven', 8: 'eight', 9: 'nine', 10: 'ten'}

# Dicts for negative numbers:
minus_result = {-1: 'negative one', -2: 'negative two', -3: 'negative three', -4: 'negative four', -5: 'negative five'}

def menu():
    print('Welcome to this calculator!')
    print('It can add and subtract whole numbers from zero to five')
    
    try:
        input_1 = input('Please choose your first number: 0 to 5 (you can also text => zero to five): ')
        if input_1 in number_to_text.values():
            number_1 = list(number_to_text.keys())[list(number_to_text.values()).index(input_1)]
        else:
            number_1 = int(input_1)
        
        valid_options = [1, 2, 3]
        while True:
            print('What do you want to do?')
            print('1: plus')
            print('2: minus')
            print('3: exit')   
            math_op = int(input('Choose one of the options above: '))
                     
            
            if math_op in valid_options:
                break
            else:
                print("Invalid input. Please enter a valid option (1, 2, or 3).")
        
        input_2 = input('Please choose your second number: 0 to 5 (you can also text => zero to five): ')
        if input_2 in number_to_text.values():
            number_2 = list(number_to_text.keys())[list(number_to_text.values()).index(input_2)]
        else:
            number_2 = int(input_2)
        
        if math_op == 1:
            result = number_1 + number_2
            result_text = f"{number_to_text.get(result)}"
        elif math_op == 2:
            result = number_1 - number_2
            result_text = f"{number_to_text.get(result)}"
        elif math_op == 3:
            print("Thanks for using this calculator, goodbye :)")
            return
        
        if result in plus_result:
            result_text = f"{plus_result.get(result)}"
        elif result in minus_result:
            result_text = f"{minus_result.get(result)}"        

        print(f'Result of {input_1} {"plus" if math_op == 1 else "minus"} {input_2} is: {result} ({result_text})')
    except ValueError:
        print("Invalid input. Please enter valid numbers.")
    input('To continue, press enter')

# Main
math_op = 0
while math_op != 3:
    system("cls")
    math_op = menu()