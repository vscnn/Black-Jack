class Card
  attr_reader :name, :value

  CARDS_NAME = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  CARDS_TYPE = %w[♣ ♥ ♠ ♦].freeze

  def initialize(name, value)
    @name = name
    @value = value
  end

  def ace?
    @name.include?('A')
  end
end
