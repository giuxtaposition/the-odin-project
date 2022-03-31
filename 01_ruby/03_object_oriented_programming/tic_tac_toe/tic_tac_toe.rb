# frozen_string_literal: true

# Tic_tac_toe game
class TicTacToe
  attr_reader :grid, :player_symbol

  def initialize(player_symbol)
    invalid_player_symbol?(player_symbol)
    @grid = Grid.new
    @player_symbol = player_symbol
    @grid.render
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

class Grid
  TEMPLATE = <<~EOD
    ┌───┬───┬───┐
    │ 1 │ 2 │ 3 │
    ├───┼───┼───┤
    │ 4 │ 5 │ 6 │
    ├───┼───┼───┤
    │ 7 │ 8 │ 9 │
    └───┴───┴───┘
  EOD

  attr_accessor :marker_positions

  def initialize
    @marker_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def render
    puts TEMPLATE.gsub(/[1-9]/) { |d| @marker_positions[d.to_i - 1] }
  end
end
