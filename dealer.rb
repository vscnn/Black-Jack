require_relative 'player'

class Dealer < Player
  def initialize(name = '')
    super
  end

  def turn
    # 0 for skipped turn
    if current_value < 17
      add_card
    else
      0
    end
  end
end
