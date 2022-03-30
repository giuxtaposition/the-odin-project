# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../bubble_sort'

RSpec.describe 'Bubble Sort' do
  it 'given an array of numbers, order in ascending order with bubble sort algorithm' do
    expect(bubble_sort([4, 3, 78, 2, 0, 2])).to eq([0, 2, 2, 3, 4, 78])
  end
end
