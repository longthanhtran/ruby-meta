module StringExtenstions
  refine String do
    def reverse
      "esrever"
    end
  end
end

module StringStuff
  using StringExtenstions
  puts "my_string".reverse
end

puts "my_string".reverse
