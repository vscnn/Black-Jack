require_relative 'deposit'
require_relative 'game'
require_relative 'player'

class Dealer < Player
  def initialize(name = '')
    super
  end

  def turn
    if current_value < 17
      add_card
    else
      puts 'Дилер пропустил ход'
    end
  end
end
