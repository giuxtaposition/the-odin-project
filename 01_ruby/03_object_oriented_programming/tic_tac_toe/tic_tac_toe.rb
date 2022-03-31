# frozen_string_literal: true

# Tic_tac_toe game
class TicTacToe
  attr_reader :grid, :player_symbol

  def initialize(player_symbol)
    invalid_player_symbol?(player_symbol)
    @grid = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @player_symbol = player_symbol
    print_grid
  end

  private

  def print_grid
    printed_grid = []
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        printed_grid << " #{cell} "
        printed_grid << '|' if cell_index < 2
      end
      printed_grid << "\n---+---+---\n" if row_index < 2
    end
    puts printed_grid.join
  end

  def invalid_player_symbol?(player_symbol)
    return unless player_symbol != 'X' && player_symbol != 'O'

    raise InvalidPlayerSymbolException, player_symbol
  end

  # invalid player symbol exception
  class InvalidPlayerSymbolException < StandardError
    def initialize(symbol)
      super("Invalid player symbol: #{symbol}")
    end
  end
end
