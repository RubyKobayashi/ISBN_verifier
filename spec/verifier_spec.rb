# frozen_string_literal: true

require 'verifier'

# As a user,
# So I know my ISBN code is in the right format
# I want to be notified with an error if my ISBN code is not a string

RSpec.describe Verifier do
  subject(:verifier) { described_class.new }

  describe '#isbn_10' do
    context 'when input is not a string' do
      it 'raises an error' do
        non_string = 1234
        expect { verifier.isbn_10(non_string) }.to raise_error('Input is not a string, please input a string')
      end
    end
    context 'when input is a string' do
      it 'does not raise an error' do
        string = '1234'
        expect { verifier.isbn_10(string) }.not_to raise_error('Input is not a string, please input a string')
      end
    end

    # As a user,
    # So I know my ISBN code has the correct number of digits
    # I want to be notified with an error if my ISBN code is under or over 10 digits

    context 'when input is empty' do
      it 'raises an error' do
        not_10_digits = ''
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 1 digit long' do
      it 'raises an error' do
        not_10_digits = '1'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 2 digits long' do
      it 'raises an error' do
        not_10_digits = '12'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 3 digits long' do
      it 'raises an error' do
        not_10_digits = '123'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 4 digits long' do
      it 'raises an error' do
        not_10_digits = '1234'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 5 digits long' do
      it 'raises an error' do
        not_10_digits = '12345'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 6 digits long' do
      it 'raises an error' do
        not_10_digits = '123456'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 7 digits long' do
      it 'raises an error' do
        not_10_digits = '1234567'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 8 digits long' do
      it 'raises an error' do
        not_10_digits = '12345678'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 9 digits long' do
      it 'raises an error' do
        not_10_digits = '123456789'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 10 digits long' do
      it 'raises an error' do
        ten_digits = '0123456789'
        expect { verifier.isbn_10(ten_digits) }.not_to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 11 digits long' do
      it 'raises an error' do
        not_10_digits = '12345678911'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when user has a valid ISBN code' do
      it 'notifies the user they have a valid ISBN code' do
        isbn = '3598215088'
        expect { verifier.isbn_10(isbn) }.to output("You have a valid ISBN code\n").to_stdout
      end
    end
  end
end
