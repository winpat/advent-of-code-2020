file = File.open("balance.txt")
sorted_numbers = file.readlines.map { |line| line.chomp.to_i }.sort
file.close()

ncount = sorted_numbers.length

sorted_numbers.each do |x|
  sorted_numbers.each do |y|
    if x + y == 2020
      puts x * y
    end
  end
end
