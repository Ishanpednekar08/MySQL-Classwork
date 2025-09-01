
#1. Basic Info (Data Types & Operators):
sales = [1200, 1500, 1700, 800, 950, 2000, 2100, 1750, 1600, 1850, 1950, 2200, 2500, 3000]
total_sales = sum(sales) 
print(total_sales)

average_sales = total_sales/len(sales)   
print(average_sales)

highest_sales = max(sales)
print(highest_sales)

lowest_sales = min(sales)
print(lowest_sales)

#2. Loops & Control Structures:
sales_above_average = 0 
sales_below_average = 0



#3. List Operations:


sorted_sales = sorted(sales,reverse=True)
print(sorted_sales)

reversed_sales = list(reversed(sales))
print(reversed_sales)

#4. Decision Making (If-Else):

if total_sales > 20000:
    print("Good Performance" )
else: 
    print("Needs Improvement")
        

#5. Bonus (Optional - for extra points):
target = int(input("Enter target sales : "))        
        
        