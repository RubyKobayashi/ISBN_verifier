# frozen_string_literal: true

require 'verifier'

# As a user,
# So I know my ISBN code is in the right format
# I want to be notified with an error if my ISBN code is not a string

RSpec.describe 'ISBN_10_Verifier' do
  describe '#ISBN_validator' do
    context 'when input is not a string' do
      it 'raises an error' do
        verifier = Verifier.new
        non_string = 1234
        expect { verifier.isbn_validator(non_string) }.to raise_error('Input is not a string, please input a string')
      end
    end

    # As a user,
    # So I know my ISBN code has the correct number of digits
    # I want to be notified with an error if my ISBN code is under or over 10 digits

    context 'when input is not 10 digits long' do
      it 'raises an error' do
        verifier = Verifier.new
        not_10_digits = '123456789'
        expect { verifier.isbn_validator(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
  end
end
