require_relative './quiz_test'

# Here is the method that you should implement
def add_checked_attribute(klass, attribute)
  eval <<-enclosed_block
    class #{klass}
      def #{attribute}=(value)
        raise 'Invalid attribute' unless value
        @#{attribute} = value
      end

      def #{attribute}()
        @#{attribute}
      end
    end
  enclosed_block
end

# puts add_checked_attribute(String, :my_attr)
