# frozen_string_literal: true

require 'converter'

RSpec.describe Converter do
  subject(:converter) { described_class.new }
  let(:verifier) { instance_double('Verifier') }

  it '#delete_hyphens' do
    isbn = '3-598-21508-8'
    no_hyphens = '3598215088'
    expect(converter.delete_hyphens(isbn)).to eq(no_hyphens)
  end

  it '#delete_x' do
    isbn = '3-598-21507-X'
    no_x = '359821507X'
    expect(converter.delete_hyphens(isbn)).to eq(no_x)
  end
end
