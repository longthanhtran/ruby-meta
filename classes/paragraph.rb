class Paragraph
  def initialize(text)
    @text = text
  end

  # The only method for the whole alike String class
  def title?
    @text.upcase == @text
  end

  def reverse
    @text.reverse
  end

  def upcase
    @text.upcase
  end

  # ...
end
