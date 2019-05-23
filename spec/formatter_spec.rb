# frozen_string_literal: true

require 'formatter'

RSpec.describe Formatter do
  subject(:formatter) { described_class.new }
  let(:verifier) { instance_double('Verifier') }

  it '#delete_hyphens' do
    formatter = Formatter.new
    isbn = '3-598-21508-8'
    no_hyphens = '3598215088'
    expect(formatter.delete_hyphens(isbn)).to eq(no_hyphens)
  end

  it '#delete_x' do
    formatter = Formatter.new
    isbn = '3-598-21507-X'
    no_x = '359821507X'
    expect(formatter.delete_hyphens(isbn)).to eq(no_x)
  end
end
