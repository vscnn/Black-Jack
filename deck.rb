require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    generate
    @cards.shuffle!
  end

  def generate
    @cards = []
    Card::CARDS_TYPE.map do |type|
      Card::CARDS_NAME.map do |card|
        current_value = card.to_i
        if card.to_i.zero? && card != 'A'
          current_value = 10
        elsif card == 'A'
          current_value = 11
        end
        @cards << Card.new(card.to_s + type, current_value)
      end
    end
  end

  def give_a_card
    @cards.pop
  end
end
