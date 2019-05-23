# frozen_string_literal: true

# :nodoc:
class Generator
  def initialize(verifier, converter)
    @verifier = verifier
    @converter = converter
  end

  def isbn_13(isbn10)
    sum = @verifier.sum
    @verifier.check_input_is_string(isbn10)
    @converter.delete_hyphens(isbn10)
    formatted_code = @converter.isbn
    @verifier.check_input_is_10_digits_long(formatted_code)
    @verifier.isbn_10_algorithm(formatted_code)
    if @verifier.last_digit_x(formatted_code)
      @converter.delete_x
      sum.push(Converter::X)
    end
    if @verifier.valid_isbn?(formatted_code)
      isbn12 = formatted_code.chop.prepend('978')
      last_digit(isbn12)
      puts "Your ISBN-13 code is #{isbn12 + @last_digit.to_s}"
    end
  end

  def last_digit(formatted_code)
    total = []
    array = formatted_code.split('')
    array.each_with_index do |element, index|
      multiple = if index.even?
                   1
                 else
                   3
                 end
      total.push(element.to_i * multiple)
      reduced = total.inject(0) { |sum, x| sum + x }
      @modulo = reduced % 10
      @last_digit = 10 - @modulo
    end
  end
end
