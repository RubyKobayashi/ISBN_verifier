# frozen_string_literal: true

# :nodoc:
class Converter
  attr_reader :isbn

  X = 10

  def delete_hyphens(string)
    @isbn = string.tr('-', '')
  end

  def delete_x
    @isbn.chop!
  end
end
