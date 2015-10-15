require 'array_core_extensions'

class Board
  attr_reader :grid
  def initialize(input = {})
    @grid = input.fetch(:grid, default_grid)
  end

  def get_cell(x, y)
    grid[y][x]
  end

  def set_cell(x, y, value)
    if get_cell(x, y).blank?
      grid[y][x] = value
    else
      'cannot overide cell value'
    end
  end

  def status
    return :winner if winner?
    return :tie if tie?
    'Game in Progress'
  end

  private

  def default_grid
    [['']*3]*3
  end

  def tie?
    grid.flatten.none_empty?
  end

  def winner?
    winning_combinations.each do |winning_position|
      next if winning_position.all_empty?
      return true if winning_position.all_same?
    end
    false
  end

  def winning_combinations
    rows + columns + diagonals
  end

  def rows
    grid
  end

  def columns
    grid.transpose
  end

  def diagonals
    [left_diagonal, right_diagonal]
  end

  def left_diagonal
    [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)]
  end

  def right_diagonal
    [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
  end
end