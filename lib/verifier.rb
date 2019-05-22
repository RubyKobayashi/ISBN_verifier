# frozen_string_literal: true

# :nodoc:
class Verifier
  attr_reader :string

  def self.isbn_10(string)
    @string = string
    check_input
  end

  private_class_method

  def self.check_input
    check_input_is_string
    check_input_is_10_digits_long
  end

  def self.check_input_is_string
    raise 'Input is not a string, please input a string' unless @string.is_a? String
  end

  def self.check_input_is_10_digits_long
    raise 'Input is not 10 digits long, invalid ISBN code' unless @string.length == 10
  end
end
