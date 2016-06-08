
# Class Macro pattern
class Class
  def attr_checked(attribute, &validation)
    define_method "#{attribute}=" do |value|
      raise 'Invalid attribute' unless validation.call(value)
      instance_variable_set("@#{attribute}", value)
    end
    define_method attribute do
      instance_variable_get "@#{attribute}"
    end
  end
end

require_relative './quiz_macro_test'

class Person
  attr_checked :age do |v|
    v >= 18
  end
end
