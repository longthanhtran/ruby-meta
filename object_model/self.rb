class MyClass
  def testing_self
    @var = 10
    my_method()
    self
  end

  def my_method
    @var = @var + 1
  end
end

obj = MyClass.new
puts obj.testing_self.inspect
