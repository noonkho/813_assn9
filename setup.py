# add_val = 3
# upperbound = 5
# for i in range(1,add_val+1):
#     for j in range(upperbound):
#         if i + j <= upperbound:
#             string = "(add num" + str(j) + " num" + str(i) + " num" + str(i+j) + ")"
#             print(string, end=" ")
#     print()

def printAdd(upperbound, add_choice = 3):
    for i in range(1,add_choice+1):
        for j in range(upperbound):
            if i + j <= upperbound:
                string = "(add num" + str(j) + " num" + str(i) + " num" + str(i+j) + ")"
                print(string, end=" ")
        print()

# printAdd(10, 3)


def printSub(upperbound, sub_choice = 3):
    for i in range(1, sub_choice+1):
        for j in range(upperbound, 0, -1):
            if j - i >= 0:
                string = "(sub num" + str(j) + " num" + str(i) + " num" + str(j - i) + ")"
                print(string, end=" ")
        print()

# printSub(10, 3)


def printMul(upperbound, mul_choice = 3):
    for i in range(2, mul_choice+1):
        for j in range(upperbound):
            if j * i <= upperbound:
                string = "(mul num" + str(j) + " num" + str(i) + " num" + str(i * j) + ")"
                print(string, end=" ")
        print()

# printMul(10,3)

def printGreater(upperbound):
    upperbound+=1 # For the syntax of range() in Python
    for i in range(upperbound):
        for j in range(upperbound):
            if j > i:
                string = "(greater num" + str(j) + " num" + str(i) + ")"
                print(string, end=" ")
        print()

# printGreater(10)

def printLesser(upperbound):
    for i in range(upperbound,0,-1):
        for j in range(upperbound+1):
            if j < i:
                string = "(lesser num" + str(j) + " num" + str(i) + ")"
                print(string, end=" ")
        print()

# printLesser(10)

def printSucc(upperbound):
    for i in range(upperbound):
        string = "(succ num" + str(i) + " num" + str(i+1) + ")"
        print(string, end=" ")

printSucc(10)

def printconnect(lis):
    cell_index = []
    for row_index, row in enumerate(lis):
        for col_index in range(len(row)):
            cell_index.append(str(row_index) + str(col_index))
    
    # print(cell_index)

    for i in cell_index:
        for j in cell_index:
            if (abs(int(i[0]) - int(j[0])) + abs(int(i[1]) - int(j[1]))) == 1:
                string = "(connect " + lis[int(j[0])][int(j[1])] + " " + lis[int(i[0])][int(i[1])] + ")"
                print(string, end=" ")
        print()

    # for row_index, row in enumerate(lis):
    #     for col_index, val in enumerate(row):
    #         if abs(row_index - col_index) == 1:
    #             string = "(connect " + val
    



lis = [["c11", "c12", "c13"],
       ["c21", "c22", "c23"],
       ["c31", "c32", "c33"]]

# (connect c11 c12) (connect c11 c21)
# (connect c12 c11) (connect c12 c22) (connect c12 c13)
# (connect c13 c12) (connect c13 c23)
# (connect c21 c11) (connect c21 c22) (connect c21 c31)
# (connect c22 c12) (connect c22 c21) (connect c22 c23) (connect c22 c32)
# (connect c23 c13) (connect c23 c22) (connect c23 c33)
# (connect c31 c21) (connect c31 c32)
# (connect c32 c31) (connect c32 c22) (connect c32 c33)
# (connect c33 c23) (connect c33 c32) 
 

# printconnect(lis)