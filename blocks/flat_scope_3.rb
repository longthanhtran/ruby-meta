my_var = "Success"

MyClas = Class.new do
  puts "#{my_var} in the class definition"

  define_method :my_method do
    puts "#{my_var} in the method"
  end
end
