# Method hooks - available since Ruby 2.0
# included
# extended
# prepended
# inherited
# method_missing
module M1
  def self.included(other_module)
    puts "#{self} was included into #{other_module}"
  end
end

module M2
  def self.prepended(other_module)
    puts "M2 was prepended to #{other_module}"
  end
end

class C
  include M1
  prepend M2
end

puts C.new.inspect
