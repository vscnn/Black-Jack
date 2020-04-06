require_relative 'card'

class Deck
  attr_accessor :cards
  CARDS_NAME = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  CARDS_TYPE = %w[♣ ♥ ♠ ♦].freeze

  def self.generate
    @@cards = []
    CARDS_TYPE.map do |type|
      CARDS_NAME.map do |card|
        current_value = card.to_i
        if card.to_i.zero? && card != 'A'
          current_value = 10
        elsif card == 'A'
          current_value = 11
        end
        @@cards << Card.new(card.to_s + type, current_value, false)
      end
    end
  end

  def self.random
    choosed_card = @@cards.select { |card| card.in_use == false }.sample
    @@cards.select { |card| card.object_id == choosed_card.object_id }.first.in_use = true
    choosed_card
  end

  self.generate
end
