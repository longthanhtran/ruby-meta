module MyModule
  def my_method; end
end

class MyClass
  class << self
    include MyModule
  end
end
