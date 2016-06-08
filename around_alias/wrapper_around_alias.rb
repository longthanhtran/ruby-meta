# Be careful with Around Alias, it leaks the modification everywhere
class String
  alias_method :real_length, :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

str = "War and Peace"
puts "When I call with length(): #{str.length}"
puts "When I call with real_length(): #{str.real_length}"
