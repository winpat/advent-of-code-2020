file = File.open("tree-map.txt")
tree_map = file.readlines.map { |line| line.chomp.chars }
file.close()

trees = 0
row, col = 0, 0
map_width = 31

tree_map[1..tree_map.length-1].each do
  col = (col + 3) % map_width
  row += 1
  if tree_map[row][col] == "#"
    trees += 1
  end
end

puts trees
