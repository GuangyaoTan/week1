"""Small functions combining conditionals and loops."""

def foo_1(x):
    return x ** 0.5

def foo_2(x, y):
    if x > y:
        return x
    return y

def foo_3(x, y, z):
    if x > y:
        x, y = y, x
    if x > z:
        x, z = z, x
    if y > z:
        y, z = z, y
    return [x, y, z]

def foo_4(x):
    result = 1
    for i in range(1, x + 1):
        result = result * i
    return result

def foo_5(x):  # recursive factorial
    if x < 0:
        raise ValueError("x must be non-negative")
    if x <= 1:
        return 1
    return x * foo_5(x - 1)

def foo_6(x):  # factorial with a while loop
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    return facto

def main():
    print(foo_1(16))                                   # 4.0
    print(foo_2(3, 7))                                 # 7
    print(foo_3(9, 2, 5))                              # [2, 5, 9]
    print(foo_4(5), foo_5(5), foo_6(5))                # 120 120 120
    print(foo_4(0), foo_5(0), foo_6(0))                # 1 1 1
    print(all(foo_4(n) == foo_5(n) == foo_6(n) for n in range(11)))   # True

if __name__ == "__main__":
    main()