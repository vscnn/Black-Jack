require_relative 'deck'

class Hand
  attr_accessor :current_cards

  def initialize(player)
    @current_cards = []
    2.times { @current_cards << Deck.random }
  end

  def current_value
    sum = @current_cards.sum(&:value)
    if (@current_cards.length > 2 && ((@current_cards[0].value + @current_cards[1].value) > 10) && @current_cards.last.name.include?('A')) || (@current_cards[0].name.include?('A') && @current_cards[1].name.include?('A'))
      sum -= 10
    end
    sum
  end

  def add_card
    @current_cards << Deck.random
  end
end
