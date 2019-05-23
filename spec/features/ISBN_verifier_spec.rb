# frozen_string_literal: true

require 'verifier'
require 'converter'

# As a user,
# So I know my ISBN code is in the right format
# I want to be notified with an error if my ISBN code is not a string

RSpec.describe 'ISBN_10_Verifier' do
  subject(:converter) { Converter.new }
  subject(:verifier) { Verifier.new converter }
  describe '#isbn_10' do
    context 'when input is not a string' do
      it 'raises an error' do
        non_string = 1234
        expect { verifier.isbn_10(non_string) }.to raise_error('Input is not a string, please input a string')
      end
    end

    # As a user,
    # So I know my ISBN code has the correct number of digits
    # I want to be notified with an error if my ISBN code is under or over 10 digits

    context 'when input is not 10 digits long' do
      it 'raises an error' do
        not_10_digits = '123456789'
        expect { verifier.isbn_10(not_10_digits) }.to raise_error('Input is not 10 digits long, invalid ISBN code')
      end
    end

    # As a user,
    # So I know when I have a valid ISBN code
    # I want the program to confirm when I have a valid ISBN code

    context 'when user has a valid ISBN code' do
      it 'notifies the user they have a valid ISBN code' do
        isbn = '3598215088'
        expect { verifier.isbn_10(isbn) }.to output("You have a valid ISBN code\n").to_stdout
      end
    end

    # As a user,
    # So I know when I have an invalid valid ISBN code
    # I want the program to confirm that I have an invalid ISBN code

    context 'when user has an invalid ISBN code' do
      it 'notifies the user they have an invalid ISBN code' do
        isbn = '3598215087'
        expect { verifier.isbn_10(isbn) }.to output("You have an invalid ISBN code\n").to_stdout
      end
    end

    # As a user,
    # So I can have ISBN code without hyphens verified correctly
    # I want the program to be able to read codes without hyphens

    context 'when user has a valid ISBN code with hyphens' do
      it 'notifies the user they have a valid ISBN code' do
        string = '3-598-21508-8'
        expect { verifier.isbn_10(string) }.to output("You have a valid ISBN code\n").to_stdout
      end
    end

    context 'when user has an invalid ISBN code with hyphens' do
      it 'notifies the user they have an valid ISBN code' do
        string = '3-598-21508-6'
        expect { verifier.isbn_10(string) }.to output("You have an invalid ISBN code\n").to_stdout
      end
    end

    # As a user,
    # So I can have ISBN codes ending with an 'X' verified correctly
    # I want the 'X' to equal 10

    context 'when user has a valid ISBN code which ends in X' do
      it 'processes the X as a 10' do
        string = '3-598-21507-X'
        expect { verifier.isbn_10(string) }.to output("You have a valid ISBN code\n").to_stdout
      end
    end

    # As a user,
    # So I can have invalid ISBN codes ending with an 'X' evaluated
    # I want to be notified that I have an invalid ISBN code

    context 'when user has an invalid ISBN code which ends in X' do
      it 'notifies the user they have an invalid ISBN code' do
        string = '3-598-21506-X'
        expect { verifier.isbn_10(string) }.to output("You have an invalid ISBN code\n").to_stdout
      end
    end
  end
end
