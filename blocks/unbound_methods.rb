module MyModule
  def my_method
    42
  end
end

unbound = MyModule.instance_method(:my_method)
unbound.class # => UnboundMethod

# Start from Ruby 2.0 with Module, no same type restriction.
String.class_eval do
  define_method :another_method, unbound
end

"abc".another_method # => 42
