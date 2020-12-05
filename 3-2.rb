file = File.open("tree-map.txt")
tree_map = file.readlines.map { |line| line.chomp.chars }
file.close()

map_width = 31

Slope = Struct.new(:dx, :dy)

slopes = [
  Slope.new(1, 1),
  Slope.new(3, 1),
  Slope.new(5, 1),
  Slope.new(7, 1),
  Slope.new(1, 2),
]

trees_by_slope = []

slopes.each do |slope|
  row, col = 0, 0
  encountered_trees = 0

  steps = (1..tree_map.length-slope.dy).step(slope.dy)

  steps.each {
    col = (col + slope.dx) % map_width
    row += slope.dy
    encountered_trees += 1 if tree_map[row][col] == "#"
  }

  puts encountered_trees
  trees_by_slope.append(encountered_trees)
end


puts trees_by_slope.inject(:*)
