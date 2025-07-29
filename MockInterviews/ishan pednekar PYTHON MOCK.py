# Single Line Comment

"""
This
is a
multi-line
comment
"""

#------------------------------------------ Task 1: Calculator Program ----------------------------------------------

number1 = int(input('Enter your number: '))
number2 = int(input('Enter your number: '))
print('sum:', number1 + number2)
print('substract:' , number1 - number2)
print('multiply:', number1 * number2)
print('divide:', number1 / number2)

#------------------------------------------ Task 2: Even/Odd and Prime Check ----------------------------------------------
number3 = int(input('Enter your number: '))
if number3 % 2 == 0:
    print('even number')

else:
    print('odd number')

number4 = int(input('Enter your number:'))  
if number4 > 1:
    print('prime number')
    
else:
    print('not prime number')

#------------------------------------------ Task 3: Multiplication Table Generator ----------------------------------------------
a=int(input("enter your number:"))
print(a,'*' , '1:', a*1)
print(a,'*' , '2:', a*2)
print(a,'*' , '3:', a*3)
print(a,'*' , '4:', a*4)
print(a,'*' , '5:', a*5)
print(a,'*' , '6:', a*6)
print(a,'*' , '7:', a*7)
print(a,'*' , '8:', a*8)
print(a,'*' , '9:', a*9)
print(a,'*' , '10:', a*10)

#------------------------------------------ Task 4: Find Maximum of 3 Numbers----------------------------------------------
number5 = int(input('Enter your number:'))
number6 = int(input('Enter your number:'))
number7 = int(input('Enter your number:'))

#using if--else statement
if number5 > number6:
    if number5 > number7:
        print(number5)
elif number6 > number7:
    print(number7)

elif number7 > number6:
    print (number6)
else:
    print(number7)

 #-------------------------------------------Task 5: Simple Total Marks Calculator of Students------------------------------------------
 # Calculating total marks of a student in a subject
marks_history = float(input("Enter marks in history:"))
marks_science = float(input("Enter marks in science:"))
marks_maths = float(input("Enter marks in math:"))
marks_geography = float(input("Enter marks in geography:"))
marks_civics = float(input("Enter marks in civics"))
marks_economics = float(input("Enter marks in economics"))
marks_marathi = float(input("Enter marks in marathi"))
marks_hindi = float(input("Enter marks in hindi"))
total_marks = marks_history + marks_science + marks_maths + marks_geography + marks_civics + marks_economics + marks_marathi + marks_hindi
print("Total marks =", total_marks)
 
