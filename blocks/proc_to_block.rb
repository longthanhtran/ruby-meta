def my_method(greeting)
  "#{greeting}, #{yield}!"
end

my_proc = proc { "Bill" }
puts my_method("Hello", &my_proc) # this time & operator converts Proc to block
