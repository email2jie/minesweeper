require 'byebug'
require_relative 'tile'

class Board
  attr_reader :grid
  def default_grid
    @grid = Array.new(9) do
      Array.new(9) {Tile.new()}
    end
    grid
  end
  def setup_grid
    arr = Array.new(81) {Tile.new}

    10.times do |i|
      arr[i].set_bomb
    end

    arr.shuffle!
    arr.shuffle!

    9.times do |i|
      @grid[i] = arr.shift(9)
    end

      grid
  end
  def initialize(grid = default_grid)
    @grid = grid
    @grid = setup_grid
  end

  def [](pos)
    pos = x,y
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    tile = grid[x][y]
    tile.value = value
  end
  def render

    puts "  " + (0..8).to_a.join("  ")
    grid.each_with_index do |row, i|
      puts "#{i} #{row.join(" ")}"
    end
  end


end
