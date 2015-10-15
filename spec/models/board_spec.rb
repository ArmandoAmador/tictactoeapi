require 'rails_helper'

RSpec.describe Board, type: :model do
  context '#initialize' do
    it 'initializes the board with a grid' do
      expect { Board.new(grid: 'grid') }.to_not raise_error
    end

    it 'sets the grid with three rows by default' do
      board = Board.new
      expect(board.grid.size).to eq(3)
    end

    it 'creates three things in each row by default' do
      board = Board.new
      board.grid.each do |row|
        expect(row.size).to eq(3)
      end
    end
  end

  context '#get_cell' do
    it 'returns the cell based on the (x, y) coordinate' do
      grid = [['', '', ''], ['', '', 'x'], ['', '', '']]
      board = Board.new(grid: grid)
      expect(board.get_cell(2, 1)).to eq 'x'
    end
  end

  context '#set_cell' do
    it 'updates the value of the cell object at a (x, y) coordinate' do
      grid = [['', '', ''], ['', '', ''], ['', '', '']]
      board = Board.new(grid: grid)
      board.set_cell(0, 0, 'x')
      expect(board.get_cell(0, 0)).to eq 'x'
    end

    it 'cannot overide the balue of the cell object at a (x, y) coordinate' do
      grid = [['x', '', ''], ['', '', ''], ['', '', '']]
      board = Board.new(grid: grid)
      expect(board.set_cell(0, 0, 'x')).to eq 'cannot overide cell value'
    end
  end

  context '#status' do
    it 'returns :winner if winner? is true' do
      board = Board.new
      allow(board).to receive(:winner?) { true }
      expect(board.status).to eq :winner
    end

    it 'returns :tie if winner? is false and tie? is true' do
      board = Board.new
      allow(board).to receive(:winner?) { false }
      allow(board).to receive(:tie?) { true }
      expect(board.status).to eq :tie
    end

    it "returns 'Game in Progress' if winner? is false and tie? is false" do
      board = Board.new
      allow(board).to receive(:winner?) { false }
      allow(board).to receive(:tie?) { false }
      expect(board.status).to eql 'Game in Progress'
    end

    it 'returns :winner when row has objects with values that are all the same' do
      grid = [
        ['x', 'x', 'x'],
        ['y', 'x', 'y'],
        ['y', 'y', '']
      ]
      board = Board.new(grid: grid)
      expect(board.status).to eq :winner
    end

    it 'returns :winner when colum has objects with values that are all the same' do
      grid = [
        ['x', 'x', ''],
        ['y', 'x', 'y'],
        ['y', 'x', '']
      ]
      board = Board.new(grid: grid)
      expect(board.status).to eq :winner
    end

    it 'returns :winner when diagonal has objects with values that are all the same' do
      grid = [
        ['x', '', ''],
        ['y', 'x', 'y'],
        ['y', 'x', 'x']
      ]
      board = Board.new(grid: grid)
      expect(board.status).to eq :winner
    end

    it 'returns :tie when all spaces on the board are taken' do
      grid = [
        ['x', 'y', 'x'],
        ['y', 'x', 'y'],
        ['y', 'x', 'y']
      ]
      board = Board.new(grid: grid)
      expect(board.status).to eq :tie
    end

    it 'returns false when there is no winner or tie' do
      grid = [
        ['x', '', ''],
        ['y', '', ''],
        ['y', '', '']
      ]
      board = Board.new(grid: grid)
      expect(board.status).to eql 'Game in Progress'
    end
  end
end
