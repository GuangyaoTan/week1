"""Loop and conditional examples: hello_1 to hello_6."""

def hello_1(x):
    for j in range(x):
        if j % 3 == 0:
            print('hello')
    print(' ')

def hello_2(x):
    for j in range(x):
        if j % 5 == 3:
            print('hello')
        elif j % 4 == 3:
            print('hello')
    print(' ')

def hello_3(x, y):
    for i in range(x, y):
        print('hello')
    print(' ')

def hello_4(x):
    if x > 15 or (15 - x) % 3 != 0:
        raise ValueError("x must be <= 15 and 15 - x must be a multiple of 3")
    while x != 15:
        print('hello')
        x = x + 3
    print(' ')

def hello_5(x):
    while x < 100:
        if x == 31:
            for k in range(7):
                print('hello')
        elif x == 18:
            print('hello')
        x = x + 1
    print(' ')

def hello_6(x, y):
    while x:
        print("hello! " + str(y))
        y += 1
        if y >= 6:
            break
    print(' ')

def main():
    hello_1(12)
    hello_2(12)
    hello_3(3, 17)
    hello_4(0)
    hello_5(12)
    hello_6(True, 0)

if __name__ == "__main__":
    main()