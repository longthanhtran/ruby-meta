module Printable
  def print
    # ...
    puts "I print from Printable"
  end

  def prepare_cover
    # ...
  end
end

module Document
  def print
    # ..
    puts "I print from Document"
  end

  def print_to_cover
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
    #...
  end

  def prepare_cover
    # ..
  end
end

class Book
  include Printable
  include Document
  # ...
end

b = Book.new
# puts Book.ancestors
b.print_to_cover
