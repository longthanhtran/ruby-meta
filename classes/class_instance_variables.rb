class MyClass
  @my_var = 1
  def self.read; @my_var; end
  def write; @my_var = 2; end
  def read; @my_var; end
end

obj = MyClass.new
puts "First time read instance var: #{obj.read}"
puts "Write to instance var"
obj.write
puts "Now read the instance var again: #{obj.read}"
puts "Then read the class instance var: #{MyClass.read}"
