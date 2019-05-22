# frozen_string_literal: true

require 'formatter'

RSpec.describe 'formatter' do
  let(:verifier) { instance_double('Verifier') }
  it '#delete_hyphens' do
    formatter = Formatter.new
    isbn = '3-598-21508-8'
    no_hyphens = '3598215088'
    expect(formatter.delete_hyphens(isbn)).to eq(no_hyphens)
  end
end
