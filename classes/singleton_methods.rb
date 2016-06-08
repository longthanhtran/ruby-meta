# Method belongs to a single object is called Singletone Method
#
str = "just a regular string"

def str.title?
  self.upcase == self
end

# primary way - can also create Singleton Method to an object
class << str
  def title?
    self.upcase == self
  end
end

puts str.title?
puts str.methods.grep(/title?/)
puts str.singleton_methods
