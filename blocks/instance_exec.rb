class C
  def initialize
    @x = 1
  end
end

class D
  def twisted_method
    @y = 2
    # This way, can NOT use @y since self is C instance
    # C.new.instance_eval { "@x: #{x}, @y: #{y}" }
    C.new.instance_exec(@y) {|y| "@x: #{x}, @y: #{y}"}
  end
end

D.new.twisted_method
