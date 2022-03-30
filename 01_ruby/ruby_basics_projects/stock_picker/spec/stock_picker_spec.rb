# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../stock_picker'

RSpec.describe 'Stock Picker' do
  it 'given an array of stock prices, return the best day to buy and the best day to sell' do
    expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
  end
end
