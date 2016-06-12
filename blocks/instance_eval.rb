class MyClass
  def initialize
    @v = 1
  end
end

obj = Class.new

obj.instance_eval do
  self
  @v
end
