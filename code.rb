@tries_left       = 40

letters           = 'aabbccddeeffgghhiijj'
letters_jungle    = letters.split('').sort_by{rand}
@positions_jungle = {}
20.times.each{ |position|
  @positions_jungle[position + 1] = letters_jungle[position]
}

def print_positions_left
  positions_left   = []
  @positions_jungle.each{ |key,value|
    positions_left << key
  }
  puts "Tries left: #{@tries_left}"
  puts "Positions left, elements: #{positions_left.inspect}"
  puts "Positions left, count: #{positions_left.size}"
end

def print_wait_and_clear
  puts "Press any key to continues"
  gets.chomp

  clear_screen
end

puts "-----------------------STARTING GAME----------------"
puts "There are 20 boxes filled with letters 'aabbccddeeffgghhiijj'"
puts "Try to match two by turn"
puts "\n"
print_positions_left

while(@tries_left > 0 and @positions_jungle.size > 0 )

  puts "Enter FIRST position to match"
  a = gets.chomp.to_i
  puts "Value in position #{a} = #{@positions_jungle[a]}"

  print_wait_and_clear

  puts "Enter SECOND position to match"
  b = gets.chomp.to_i
  puts "Value in position #{b} = #{@positions_jungle[b]}"

  print_wait_and_clear

  puts "Trying to match letters in position #{a} and #{b}"
  puts "\n"

  if a!=b and @positions_jungle[a] == @positions_jungle[b]
    puts "Good match!"
    @positions_jungle.delete(a)
    @positions_jungle.delete(b)
  else
    puts "Bad match!"
  end

  @tries_left = @tries_left - 1

  puts "\n"
  print_positions_left

  print_wait_and_clear
end

if @positions_jungle.size == 0
  puts "You won"
else
  puts "You lose"
end

# I have broken one law to find the right manner to write "gets.chomp", sorry