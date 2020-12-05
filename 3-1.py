from pathlib import Path

lines = [list(line) for line in Path("tree-map.txt").read_text().split()]

trees = 0
x = 0
y = 0

for line in lines[:-1]:
    x = (x + 3) % 31
    y += 1
    if lines[y][x] == "#":
        trees += 1


print(trees)
