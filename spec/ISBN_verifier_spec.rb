# frozen_string_literal: true

require 'isbn_verifier'

# As a user,
# So I know my ISBN code is in the right format
# I want to be notified with an error if my ISBN code is not a string

RSpec.describe Isbn10Verifier do
  describe '#ISBN_validator' do
    context 'when input is not a string' do
      it 'raises an error' do
        verifier = Isbn10Verifier.new
        non_string = 1234
        expect { verifier.isbn_validator(non_string) }.to raise_error('Input is not a string, please input a string')
      end
    end
    context 'when input is a string' do
      it 'does not raise an error' do
        verifier = Isbn10Verifier.new
        string = '1234'
        expect { verifier.isbn_validator(string) }.not_to raise_error
      end
    end
  end
end
