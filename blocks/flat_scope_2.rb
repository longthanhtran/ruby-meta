my_var = "Success"

MyClass = Class.new do
  puts "#{my_var} in the class definition"

  def my_method
    # we still unable to print @my_var here
  end
end
