require 'ISBN_verifier'

# As a user,
# So I know my ISBN code is in the right format
# I want to be notified with an error if my ISBN code is not a string


RSpec.describe 'ISBN_verifier' do
  describe '#ISBN_validator' do
    context 'when input is not a string' do
      it 'raises an error' do
      verifier = ISBN_verifier.new
      non_string = 1234
      expect{verifier.ISBN_validator(non_string)}.to raise_error("Input is not a string, please input a string")
      end
    end
  end
end
