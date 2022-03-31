# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../tic_tac_toe'

RSpec.describe 'Tic Tac Toe' do
  describe '#initialize' do
    it 'should istantiate a 3x3 grid' do
      game = TicTacToe.new('X')
      expect(game.grid[0].length).to eq(3)
      expect(game.grid[1].length).to eq(3)
      expect(game.grid[2].length).to eq(3)
    end

    it 'should be able to set player symbol (X or O)' do
      game = TicTacToe.new('O')
      expect(game.player_symbol).to eq('O')
    end

    it 'should throw error if player symbol is not X or O' do
      expect { TicTacToe.new('') }.to raise_error(TicTacToe::InvalidPlayerSymbolException)
    end

    it 'should print the grid' do
      grid = " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 \n"
      expect { TicTacToe.new('O') }.to output(grid).to_stdout
    end
  end
end
