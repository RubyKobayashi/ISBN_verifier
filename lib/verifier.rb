# frozen_string_literal: true

require_relative 'converter'
# :nodoc:
class Verifier
  attr_reader :converter
  attr_accessor :sum

  CORRECT_INPUT_LENGTH = 10

  def initialize(converter)
    @converter = converter
    @sum = []
    @correct_input_length = CORRECT_INPUT_LENGTH
  end

  def isbn_10(string)
    raise_not_string_error unless input_is_string(string)
    @converter.delete_hyphens(string)
    raise_not_10_digits_error unless input_is_10_digits_long(@converter.isbn)
    isbn_10_algorithm
    add_ten if last_digit_x?(@converter.isbn)
    status_confirmation(sum)
  end

  def valid_isbn?(_sum)
    (@sum.inject(0) { |sum, x| sum + x } % 11).zero?
  end

  def input_is_string(string)
    string.is_a? String
  end

  def input_is_10_digits_long(string)
    string.length == @correct_input_length
  end

  def isbn_10_algorithm
    array = @converter.isbn.split('')
    array.each_with_index do |element, index|
      multiple = array.length - index
      @sum.push(element.to_i * multiple)
    end
  end

  def last_digit_x?(formatted_code)
    formatted_code[9] == 'X'
  end

  def raise_not_string_error
    raise 'Input is not a string, please input a string'
  end

  def raise_not_10_digits_error
    raise 'Input is not 10 digits long, invalid ISBN code'
  end

  private

  def add_ten
    @converter.delete_x
    @sum.push(Converter::X)
  end

  def status_confirmation(sum)
    if valid_isbn?(sum)
      puts 'You have a valid ISBN code'
    else
      puts 'You have an invalid ISBN code'
    end
  end
end
