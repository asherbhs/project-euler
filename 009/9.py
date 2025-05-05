def find_the_triple():
    for a in range(500):
        for b in range(a + 1, 500):
            for c in range(b + 1, 500):
                if a * a + b * b == c * c and a + b + c == 1000:
                    return a * b * c

print(find_the_triple())