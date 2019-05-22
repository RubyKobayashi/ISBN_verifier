# frozen_string_literal: true

# :nodoc:
class Verifier
  def isbn_10(string)
    sum = []
    check_input(string)
    isbn_10_algorithm(string, sum)
    puts 'You have a valid ISBN code' if valid_isbn?(sum)
  end

  private

  def isbn_10_algorithm(string, sum)
    array = string.split('')
    array.each_with_index do |element, index|
      multiple = 10 - index
      sum.push(element.to_i * multiple)
    end
  end

  def valid_isbn?(sum)
    (sum.inject(0) { |sum, x| sum + x } % 11).zero?
  end

  def check_input(string)
    check_input_is_string(string)
    check_input_is_10_digits_long(string)
  end

  def check_input_is_string(string)
    raise 'Input is not a string, please input a string' unless string.is_a? String
  end

  def check_input_is_10_digits_long(string)
    raise 'Input is not 10 digits long, invalid ISBN code' unless string.length == 10
  end
end
