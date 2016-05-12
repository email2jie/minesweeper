require 'byebug'
class Tile
  attr_reader :bomb, :flag, :checked, :revealed

  def initialize(bomb=false, flag=false, checked=0, revealed = false)
    @bomb = bomb
    @flag = flag
    @checked = 0
    @revealed = revealed
  end

  def set_bomb
    @bomb = true
  end

  def change_flag
    @flag == false ? @flag = true : @flag = false
  end

  def inc_checked
    checked+=1
  end

  def reveal
    @revealed = true
  end
end
