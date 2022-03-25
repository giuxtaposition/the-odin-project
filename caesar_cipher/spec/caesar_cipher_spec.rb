# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../caesar_cipher'

RSpec.describe 'Caesar Cipher' do
  it 'empty character returns empty character' do
    expect(caesar_cipher(' ', 2)).to eq(' ')
  end
  it 'special character returns special character' do
    expect(caesar_cipher('!', 2)).to eq('!')
  end
  it 'downcase returns downcase character encoded correctly' do
    expect(caesar_cipher('a', 2)).to eq('c')
  end
  it 'uppercase returns uppercase character encoded correctly' do
    expect(caesar_cipher('A', 2)).to eq('C')
  end
  it 'encodes character correctly even when shifts beyond alphabeth length' do
    expect(caesar_cipher('w', 4)).to eq('a')
  end
  it 'encodes character correctly even when shifts beyond alphabeth length*2' do
    expect(caesar_cipher('w', 56)).to eq('a')
  end
  it 'provided example returns "Bmfy f xywnsl!"' do
    expect(caesar_cipher('What a string!', 5)).to eq('Bmfy f xywnsl!')
  end
end
