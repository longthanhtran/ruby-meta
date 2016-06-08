require 'test/unit'

# class Person; end

class TestCheckedAttribute < Test::Unit::TestCase
  def setup
    # add_checked_attribute(Person, :age) {|v| v >= 18}
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_invalid_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = 17
    end
  end
end


