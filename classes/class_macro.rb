# Both below instance methods for one single attribute
# can be handled by Class Marco from Module#attr_* family
#
class MyClass
  def my_attribute=(value)
    @my_attribute = value
  end

  def my_attribute
    @my_attribute
  end
end

# Here is the sample with Class Macro
class YourClass
  attr_accessor :my_attribute
end
