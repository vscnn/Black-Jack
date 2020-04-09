require_relative 'player'
require_relative 'game'

class Dealer < Player
  def initialize(name = '')
    super
  end

  def turn(deck)
    # 0 for skipped turn
    if self.hand.current_value < 17
      self.hand.add_a_card(deck.give_a_card)
    else
      0
    end
  end
end
