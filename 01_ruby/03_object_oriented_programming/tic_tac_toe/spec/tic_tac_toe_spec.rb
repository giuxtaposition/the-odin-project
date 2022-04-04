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

  describe 'play' do
    game = TicTacToe.new('O')
    it 'first player turn, then cpu turn' do
      after_player_turn = <<~EOD
        ┌───┬───┬───┐
        │ O │ 2 │ 3 │
        ├───┼───┼───┤
        │ 4 │ 5 │ 6 │
        ├───┼───┼───┤
        │ 7 │ 8 │ 9 │
        └───┴───┴───┘
      EOD

      after_cpu_turn = <<~EOD
        ┌───┬───┬───┐
        │ O │ 2 │ 3 │
        ├───┼───┼───┤
        │ 4 │ X │ 6 │
        ├───┼───┼───┤
        │ 7 │ 8 │ 9 │
        └───┴───┴───┘
      EOD

      expect(game)
        .to receive(:gets)
        .and_return('1')
      expect(game)
        .to receive(:available_positions)
        .and_return([5])

      expect { game.play }.to output("#{after_player_turn}#{after_cpu_turn}").to_stdout
    end
  end
end
