# frozen_string_literal: true

# :nodoc:
class Formatter
  attr_reader :isbn

  def intialize; end

  def delete_hyphens(string)
    @isbn = string.tr('-', '')
  end
end
