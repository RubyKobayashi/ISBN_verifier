# frozen_string_literal: true

require_relative 'formatter'
# :nodoc:
class Verifier
  attr_reader :formatter

  def initialize(formatter)
    @formatter = formatter
  end

  def isbn_10(string)
    sum = []
    check_input_is_string(string)
    @formatter.delete_hyphens(string)
    formatted_code = @formatter.isbn
    check_input_is_10_digits_long(formatted_code)
    isbn_10_algorithm(formatted_code, sum)
    if last_digit_x(formatted_code)
      @formatter.delete_x
      sum.push(Formatter::X)
    end
    status_confirmation(sum)
  end

  private

  def check_input_is_string(string)
    raise 'Input is not a string, please input a string' unless string.is_a? String
  end

  def check_input_is_10_digits_long(string)
    raise 'Input is not 10 digits long, invalid ISBN code' unless string.length == 10
  end

  def isbn_10_algorithm(_formatted_code, sum)
    array = @formatter.isbn.split('')
    array.each_with_index do |element, index|
      multiple = array.length - index
      sum.push(element.to_i * multiple)
    end
  end

  def last_digit_x(formatted_code)
    formatted_code[9] == 'X'
  end

  def valid_isbn?(sum)
    (sum.inject(0) { |sum, x| sum + x } % 11).zero?
  end

  def status_confirmation(sum)
    if valid_isbn?(sum)
      puts 'You have a valid ISBN code'
    else
      puts 'You have an invalid ISBN code'
    end
  end
end
