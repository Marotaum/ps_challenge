
@tries_left = 40
letters = 'aabbccddeeffgghhiijj'
letters_jungle = letters.split('').sort_by { rand }
@positions_jungle = {}
20.times.each { |position| @positions_jungle[position + 1] = letters_jungle[position] }

def print_wait_and_clear
  puts "Press any key to continues"
  gets.chomp
  clear_screen
end

def print_left_tries
  positions_left = []
  @positions_jungle.each { |key, _| positions_left << key }
  puts "Positions left, elements = #{positions_left.inspect}"
  puts "Positions left, count = #{positions_left.size}"
  puts "Tries left = #{@tries_left}"
end

def read_user_input(name)
  puts "Enter #{name} position to try a match"
  selected = gets.chomp.to_i
  puts "Value in position #{selected} = #{@positions_jungle[selected]}"    
  selected
end

puts "------- STARTING game ------- "
puts "The computer makes 20 boxes, numbered 1 to 20. Into each box, it places a single letter randomly taken from the set of letters: 'aabbccddeeffgghhiijj. The aim of the game is to remove all the boxes."

print_left_tries
print_wait_and_clear

while @tries_left > 0 && @positions_jungle.empty?
  a = read_user_input('FIRST')
  print_wait_and_clear
  b = read_user_input('SECOND')
  print_wait_and_clear
  if a != b && @positions_jungle[a] == @positions_jungle[b]
    puts "GOOD match!"
    @positions_jungle.delete(a)
    @positions_jungle.delete(b)
  else
    puts "BAD match!"
  end
  @tries_left -=
  print_left_tries
  print_wait_and_clear
end

if @positions_jungle.empty?
  puts "You WON!"
else
  puts "You LOSE!"
end

puts "------- END game -------"

# I have broken one law to find the right manner to write "gets.chomp", sorry
