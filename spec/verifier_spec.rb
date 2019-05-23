# frozen_string_literal: true

require 'verifier'
require 'formatter'

# As a user,
# So I know my ISBN code is in the right format
# I want to be notified with an error if my ISBN code is not a string

RSpec.describe Verifier do
  subject(:verifier) { described_class.new(formatter) }
  let(:formatter) { instance_double('Formatter') }

  before(:each) do
    allow(formatter).to receive(:delete_hyphens)
  end

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
        allow(formatter).to receive(:isbn).and_return(not_10_digits)
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 1 digit long' do
      it 'raises an error' do
        not_10_digits = '1'
        allow(formatter).to receive(:isbn).and_return(not_10_digits)
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 2 digits long' do
      it 'raises an error' do
        not_10_digits = '12'
        allow(formatter).to receive(:isbn).and_return(not_10_digits)
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 4 digits long' do
      it 'raises an error' do
        not_10_digits = '1234'
        allow(formatter).to receive(:isbn).and_return(not_10_digits)
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 5 digits long' do
      it 'raises an error' do
        not_10_digits = '12345'
        allow(formatter).to receive(:isbn).and_return(not_10_digits)
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 6 digits long' do
      it 'raises an error' do
        not_10_digits = '123456'
        allow(formatter).to receive(:isbn).and_return(not_10_digits)
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 7 digits long' do
      it 'raises an error' do
        not_10_digits = '1234567'
        allow(formatter).to receive(:isbn).and_return(not_10_digits)
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 8 digits long' do
      it 'raises an error' do
        not_10_digits = '12345678'
        allow(formatter).to receive(:isbn).and_return(not_10_digits)
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 9 digits long' do
      it 'raises an error' do
        not_10_digits = '123456789'
        allow(formatter).to receive(:isbn).and_return(not_10_digits)
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 10 digits long' do
      it 'doesnt raise an error' do
        ten_digits = '0123456789'
        allow(formatter).to receive(:isbn).and_return(ten_digits)
        expect { verifier.isbn_10(ten_digits) }.not_to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end
    context 'when input is 11 digits long' do
      it 'raises an error' do
        not_10_digits = '12345678911'
        allow(formatter).to receive(:isbn).and_return(not_10_digits)
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end

    # As a user,
    # So I know when I have a valid ISBN code
    # I want the program to confirm when I have a valid ISBN code

    context 'when user has a valid ISBN code' do
      it 'notifies the user they have a valid ISBN code' do
        isbn = '3598215088'
        allow(formatter).to receive(:isbn).and_return(isbn)
        expect { verifier.isbn_10(isbn) }.to output("You have a valid ISBN code\n").to_stdout
      end
    end

    # As a user,
    # So I know when I have an invalid valid ISBN code
    # I want the program to confirm that I have a valid ISBN code

    context 'when user has an invalid ISBN code' do
      it 'notifies the user they have an invalid ISBN code' do
        isbn = '3598215087'
        allow(formatter).to receive(:isbn).and_return(isbn)
        expect { verifier.isbn_10(isbn) }.to output("You have an invalid ISBN code\n").to_stdout
      end
    end

    # As a user,
    # So I can have ISBN code without hyphens verified correctly
    # I want the program to be able to read codes without hyphens
    context 'when user has a valid ISBN code with hyphens' do
      it 'notifies the user they have an valid ISBN code' do
        string = '3-598-21508-8'
        isbn = '3598215088'
        allow(formatter).to receive(:isbn).and_return(isbn)
        expect { verifier.isbn_10(string) }.to output("You have a valid ISBN code\n").to_stdout
      end
    end

    context 'when user has an invalid ISBN code with hyphens' do
      it 'notifies the user they have an valid ISBN code' do
        string = '3-598-21508-6'
        isbn = '3598215086'
        allow(formatter).to receive(:isbn).and_return(isbn)
        expect { verifier.isbn_10(string) }.to output("You have an invalid ISBN code\n").to_stdout
      end
    end

    # As a user,
    # So I can have ISBN codes ending with an 'X' verified correctly
    # I want the 'X' to equal 10

    context 'when user has an ISBN code which ends in X' do
      it 'processes the X as a 10' do
        string = '3-598-21507-X'
        isbn = '359821507X'
        deleted_x = '359821507'
        allow(formatter).to receive(:isbn).and_return(isbn)
        allow(formatter).to receive(:delete_x).and_return(deleted_x)
        expect { verifier.isbn_10(string) }.to output("You have a valid ISBN code\n").to_stdout
      end
    end
  end
end
