# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../tic_tac_toe'

RSpec.describe 'Tic Tac Toe' do
  describe '#initialize' do
    it 'should istantiate a 3x3 grid' do
      grid = <<~EOD
        ┌───┬───┬───┐
        │ 1 │ 2 │ 3 │
        ├───┼───┼───┤
        │ 4 │ 5 │ 6 │
        ├───┼───┼───┤
        │ 7 │ 8 │ 9 │
        └───┴───┴───┘
      EOD

      expect { TicTacToe.new('X') }.to output(grid).to_stdout
    end

    it 'should be able to set player symbol (X or O)' do
      game = TicTacToe.new('O')
      expect(game.player_symbol).to eq('O')
    end

    it 'should throw error if player symbol is not X or O' do
      expect { TicTacToe.new('') }.to raise_error(TicTacToe::InvalidPlayerSymbolException)
    end
  end
end
