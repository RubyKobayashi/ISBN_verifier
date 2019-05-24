# frozen_string_literal: true

# :nodoc:
class Generator
  def initialize(verifier, converter)
    @verifier = verifier
    @converter = converter
    @sum = @verifier.sum
  end

  def isbn_13(isbn10)
    @verifier.raise_not_string_error unless @verifier.input_is_string(isbn10)
    @converter.delete_hyphens(isbn10)
    @verifier.raise_not_10_digits_error unless @verifier.input_is_10_digits_long(@converter.isbn)
    @verifier.isbn_10_algorithm
    if @verifier.last_digit_x?(@converter.isbn)
      @converter.delete_x && add_10
    end
    if @verifier.valid_isbn?(@converter.isbn)
      create_isbn13_code(@converter.isbn)
      puts "Your ISBN-13 code is #{@isbn12 + @last_digit}"
    else
      puts 'An ISBN-13 code cannot be generated due to invalid ISBN-13 code'
    end
  end

  private

  def create_isbn13_code(formatted_code)
    @isbn12 = if formatted_code.length == 9
                formatted_code.prepend('978').tr('-', '')
              else
                formatted_code.chop.prepend('978').tr('-', '')
              end
    last_digit(@isbn12)
  end

  def add_10
    @sum.push(Converter::X)
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
      @last_digit = (10 - @modulo).to_s
    end
  end
end
