file = File.open("password_policies.txt")
password_policies = file.readlines.map { |line| line.chomp }
file.close()

valid_passwords = 0



password_policies.each do |policy|
  first_pos, second_pos, char, password = policy.match(/(\d+)-(\d+) ([a-z]): (.*)/).captures
  first_pos, second_pos = first_pos.to_i - 1, second_pos.to_i - 1
  if (password[first_pos] == char) != (password[second_pos] == char)
    valid_passwords += 1
  end
end

puts valid_passwords
