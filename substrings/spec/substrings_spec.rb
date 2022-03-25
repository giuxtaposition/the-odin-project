# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../substrings'

RSpec.describe 'Substrings' do
  it 'dictionary with one word returns word => 1' do
    result = { 'hello' => 1 }
    expect(substrings('hello', ['hello'])).to eq(result)
  end
  it 'case insensitive' do
    result = { 'hello' => 1 }
    expect(substrings('Hello', ['hello'])).to eq(result)
  end
  it 'dictionary with multiple words returns number of times word is found' do
    result = { 'hello' => 2 }
    expect(substrings('hello', %w[hello potato salad hello])).to eq(result)
  end
  dictionary = %w[below down go going horn how howdy it i low own part partner
                  sit]
  it 'also count substrings below > low' do
    result = { 'below' => 1, 'low' => 1 }
    expect(substrings('below', dictionary)).to eq(result)
  end
  it 'handle multiple words' do
    result =
      { 'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2, 'howdy' => 1, 'it' => 2, 'i' => 3, 'own' => 1,
        'part' => 1, 'partner' => 1, 'sit' => 1 }

    expect(substrings("Howdy partner, sit down! How's it going?", dictionary)).to eq(result)
  end
end
