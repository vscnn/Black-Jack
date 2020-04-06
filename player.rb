require_relative 'hand'

class Player < Hand
  attr_reader :name, :deposit

  def initialize(name)
    @name = name
    @deposit = 100
    super
  end

  def set_bet
    @deposit -= 10
  end

  def won_bet
    @deposit += 20
  end

  def draw
    @deposit += 10
  end

  def show_current_cards
    current_cards.collect(&:name).join(' ')
  end

  def hide_current_cards
    '* ' * current_cards.length
  end
end
