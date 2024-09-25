def convert_to_rpn (user_input)
  output_arr = []
  stack_arr = []

  priority_symbols = { "+" => 1, "-" => 1, "*" => 2, "/" => 2 }

  user_input.split.each do |symbol|
    if symbol =~ /\d/
      output_arr << symbol
    elsif priority_symbols[symbol]
      while !stack_arr.empty? && priority_symbols[stack_arr.last] && priority_symbols[stack_arr.last] >= priority_symbols[symbol]
        output_arr << stack_arr.pop
      end
      stack_arr << symbol
    end
  end

  while !stack_arr.empty?
    output_arr << stack_arr.pop
  end

  output_arr.join(" ")
end

print "input --> "
user_input = gets.chomp
puts "output --> #{convert_to_rpn(user_input)}"