# frozen_string_literal: true

# :nodoc:
class Isbn10Verifier
  def isbn_validator(string)
    raise 'Input is not a string, please input a string' unless string.is_a? String
  end
end
