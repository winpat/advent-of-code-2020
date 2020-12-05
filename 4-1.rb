require "set"

file = File.open("passport.txt")
lines = file.readlines.map { |line| line.chomp }
file.close()

required_fields = Set[
  "byr",
  "iyr",
  "eyr",
  "hgt",
  "hcl",
  "ecl",
  "pid",
]

passport_data = []
tmp = ""
lines.each do |line|
    if line == ""
      passport_data.append(tmp)
      tmp = ""
    else
      tmp += line + " "
    end
end
passport_data.append(tmp)

passports = []

passport_data.each do |row|
  passport = {}
  row.split(" ").each do |kv|
    k, v = kv.split(":")
    passport[k] = v
  end
  passports.append(passport)
end

puts passports

valid_passports = []

passports.each do |passport|
  if required_fields.subset?(passport.keys.to_set)
    valid_passports.append(passport)
  end
end

puts valid_passports.length
