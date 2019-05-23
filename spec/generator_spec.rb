# frozen_string_literal: true

require 'converter'
require 'verifier'
require 'generator'

RSpec.describe Generator do
  subject(:generator) { described_class.new verifier, converter }
  let(:verifier) { instance_double('Verifier') }
  let(:converter) { instance_double('Converter') }

  it 'generates #isbn_13 codes from valid ISBN-10 codes' do
    formatted_code = '3598215088'
    isbn_13 = '9783598215087'
    allow(verifier).to receive(:sum)
    allow(verifier).to receive(:check_input_is_string).with(formatted_code)
    allow(converter).to receive(:delete_hyphens).with(formatted_code)
    allow(converter).to receive(:isbn).and_return(formatted_code)
    allow(verifier).to receive(:check_input_is_10_digits_long)
    allow(verifier).to receive(:isbn_10_algorithm)
    allow(verifier).to receive(:last_digit_x?).with(formatted_code)
    allow(verifier).to receive(:valid_isbn?).with(formatted_code) { :true }
    expect { generator.isbn_13(formatted_code) }.to output("Your ISBN-13 code is 9783598215087\n").to_stdout
  end
end
