class Cards
  attr_accessor :cards

  def self.generate
    @@cards = []
    cards_name = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    cards_type = %w[♣ ♥ ♠ ♦]
    cards_type.map do |type|
      cards_name.map do |card|
        current_card = {}
        current_value = card.to_i
        if card.to_i.zero? && card != 'A'
          current_value = 10
        elsif card == 'A'
          current_value = 11
        end
        current_card[:name] = card.to_s + type
        current_card[:in_use] = false
        current_card[:value] = current_value
        @@cards << current_card
      end
    end
  end

  def self.random
    choosed_card = @@cards.select { |card| card[:in_use] == false }.sample
    @@cards.select { |card| card.object_id == choosed_card.object_id }.first[:in_use] = true
    choosed_card
  end
end
