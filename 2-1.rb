file = File.open("password_policies.txt")
password_policies = file.readlines.map { |line| line.chomp }
file.close()

valid_passwords = 0

password_policies.each do |policy|
  min_occur, max_occur, char, password = policy.match(/(\d+)-(\d+) ([a-z]): (.*)/).captures
  min_occur, max_occur = min_occur.to_i, max_occur.to_i
  occur = password.count(char)
  if occur.between?(min_occur, max_occur)
    valid_passwords += 1
  end
end

puts valid_passwords
