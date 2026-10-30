def buggyfunc(x):
    y = x
    for i in range(x):
        y = y - 1
        try:
            z = x / y
        except ZeroDivisionError:
            print(f"Caught ZeroDivisionError: x = {x}, y = {y}")
    return z

buggyfunc(20)