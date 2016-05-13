require_relative 'board'
require_relative 'tile'

class Minesweeper
  def initialize
    @board = Board.new
  end
  def method_missing(method_name, *args)
    if method_name =~ /val/
      Integer(args[0])
    else
      string = args[0]
      string.split(",").map! { |char| Integer(char)}
    end
  end

  def get_pos
    pos = nil
    until pos && valid_pos?(pos)
      puts "Please enter a position on the board (e.g., '3,4')"
      print "> "

      begin
        pos = parse_pos(gets)
      rescue
        # TODO: Google how to print the error that happened inside of a rescue statement.
        puts "Invalid position entered (did you use a comma?)"
        puts ""
        puts error.backtrace
        pos = nil
      end
    end
    pos
  end
  def play_turn
    board.render
    pos = get_pos
    board[pos] = val
  end

  def run
    play_turn until solved?
    board.render
    puts "Congratulations, you win!"
  end

  def valid_pos?(pos)
    if pos.is_a?(Array) &&
      pos.length == 2 &&
      pos.all? { |x| (0..board.size - 1).include?(x) }
      return true
    else
      get_pos
    end
  end

  private
  attr_reader :board
end

game = Minesweeper.new
game.run
