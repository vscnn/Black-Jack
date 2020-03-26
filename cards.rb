module Cards
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    # ...
  end

  module InstanceMethods
    attr_accessor :cards

    def initialize
      @cards = [{ name: '2♣', value: 2, in_use: false },
                { name: '2♥', value: 2, in_use: false },
                { name: '2♠', value: 2, in_use: false },
                { name: '2♦', value: 2, in_use: false },
                { name: '3♣', value: 3, in_use: false },
                { name: '3♥', value: 3, in_use: false },
                { name: '3♠', value: 3, in_use: false },
                { name: '3♦', value: 3, in_use: false },
                { name: '4♣', value: 4, in_use: false },
                { name: '4♥', value: 4, in_use: false },
                { name: '4♠', value: 4, in_use: false },
                { name: '4♦', value: 4, in_use: false },
                { name: '5♣', value: 5, in_use: false },
                { name: '5♥', value: 5, in_use: false },
                { name: '5♠', value: 5, in_use: false },
                { name: '5♦', value: 5, in_use: false },
                { name: '6♣', value: 6, in_use: false },
                { name: '6♥', value: 6, in_use: false },
                { name: '6♠', value: 6, in_use: false },
                { name: '6♦', value: 6, in_use: false },
                { name: '7♣', value: 7, in_use: false },
                { name: '7♥', value: 7, in_use: false },
                { name: '7♠', value: 7, in_use: false },
                { name: '7♦', value: 7, in_use: false },
                { name: '8♣', value: 8, in_use: false },
                { name: '8♥', value: 8, in_use: false },
                { name: '8♠', value: 8, in_use: false },
                { name: '8♦', value: 8, in_use: false },
                { name: '9♣', value: 9, in_use: false },
                { name: '9♥', value: 9, in_use: false },
                { name: '9♠', value: 9, in_use: false },
                { name: '9♦', value: 9, in_use: false },
                { name: '10♣', value: 10, in_use: false },
                { name: '10♥', value: 10, in_use: false },
                { name: '10♠', value: 10, in_use: false },
                { name: '10♦', value: 10, in_use: false },
                { name: 'J♣', value: 10, in_use: false },
                { name: 'J♥', value: 10, in_use: false },
                { name: 'J♠', value: 10, in_use: false },
                { name: 'J♦', value: 10, in_use: false },
                { name: 'Q♣', value: 10, in_use: false },
                { name: 'Q♥', value: 10, in_use: false },
                { name: 'Q♠', value: 10, in_use: false },
                { name: 'Q♦', value: 10, in_use: false },
                { name: 'K♣', value: 10, in_use: false },
                { name: 'K♥', value: 10, in_use: false },
                { name: 'K♠', value: 10, in_use: false },
                { name: 'K♦', value: 10, in_use: false },
                { name: 'A♣', value: 11, in_use: false },
                { name: 'A♥', value: 11, in_use: false },
                { name: 'A♠', value: 11, in_use: false },
                { name: 'A♦', value: 11, in_use: false }]
    end

    def random_card
      choosed_card = @cards.select { |card| card[:in_use] == false }.sample
      @cards.select { |card| card.object_id == choosed_card.object_id }.first[:in_use] = true
      choosed_card
    end

    def refresh_cards
      @cards.select { |card| card[:in_use] == true }.each { |card| card[:in_use] = false }
    end
  end
end
