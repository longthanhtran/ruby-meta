
module ExplicitString
  def length
    super > 5 ? 'long' : 'short'
  end
end

String.class_eval do
  prepend ExplicitString
end

str = "War and Peace"

puts "Here is prepend wrapper call: #{str.length}"
