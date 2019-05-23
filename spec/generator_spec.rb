# frozen_string_literal: true

require 'converter'
require 'verifier'
require 'generator'

RSpec.describe Generator do
  subject(:generator) { described_class.new verifier, converter }
  let(:verifier) { instance_double('Verifier') }
  let(:converter) { instance_double('Converter') }

  before(:each) do
    allow(verifier).to receive(:raise_not_string_error)
    allow(verifier).to receive(:sum)
    allow(verifier).to receive(:raise_not_10_digits_error)
    allow(verifier).to receive(:input_is_10_digits_long)
    allow(verifier).to receive(:isbn_10_algorithm)
  end

  it 'generates #isbn_13 codes from valid ISBN-10 codes' do
    formatted_code = '3598215088'
    allow(verifier).to receive(:input_is_string).with(formatted_code)
    allow(converter).to receive(:delete_hyphens).with(formatted_code)
    allow(converter).to receive(:isbn).and_return(formatted_code)
    allow(verifier).to receive(:last_digit_x?).with(formatted_code)
    allow(verifier).to receive(:valid_isbn?).with(formatted_code) { true }
    expect { generator.isbn_13(formatted_code) }.to output("Your ISBN-13 code is 9783598215087\n").to_stdout
  end

  it 'doesnt generates #isbn_13 codes from invalid ISBN-10 codes' do
    formatted_code = '3598215087'
    allow(verifier).to receive(:input_is_string).with(formatted_code)
    allow(converter).to receive(:delete_hyphens).with(formatted_code)
    allow(converter).to receive(:isbn).and_return(formatted_code)
    allow(verifier).to receive(:last_digit_x?).with(formatted_code)
    allow(verifier).to receive(:valid_isbn?).with(formatted_code) { false }
    expect { generator.isbn_13(formatted_code) }.to output("An ISBN-13 code cannot be generated due to invalid ISBN-13 code\n").to_stdout
  end

  it 'generates #isbn_13 codes from valid ISBN-10 codes with hyphens' do
    valid_hyphen_code = '3-598-21508-8'
    allow(verifier).to receive(:input_is_string).with(valid_hyphen_code)
    allow(converter).to receive(:delete_hyphens).with(valid_hyphen_code)
    allow(converter).to receive(:isbn).and_return(valid_hyphen_code)
    allow(verifier).to receive(:last_digit_x?).with(valid_hyphen_code)
    allow(verifier).to receive(:valid_isbn?).with(valid_hyphen_code) { true }
    expect { generator.isbn_13(valid_hyphen_code) }.to output("Your ISBN-13 code is 9783598215087\n").to_stdout
  end
end
