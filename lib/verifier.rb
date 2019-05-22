# frozen_string_literal: true

# :nodoc:
class Verifier
  def self.isbn_10(string)
    check_input_is_string(string)
    check_input_is_10_digits_long(string)
  end

  def self.check_input_is_string(string)
    raise 'Input is not a string, please input a string' unless string.is_a? String
  end

  def self.check_input_is_10_digits_long(string)
    raise 'Input is not 10 digits long, invalid ISBN code' unless string.length == 10
  end
end
