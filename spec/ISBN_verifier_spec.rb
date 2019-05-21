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
  end
end
