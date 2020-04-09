# require_relative 'hand'
# require_relative 'deck'

class Player
  attr_reader :name, :deposit
  attr_accessor :hand

  def initialize(name)
    @name = name
    @deposit = 100
    super()
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

end

# p = Player.new('v')
# p.hand = Hand.new
# d = Deck.new
# p.hand.add_a_card(d.give_a_card)
# p.hand.add_a_card(d.give_a_card)
# puts p.hand.current_cards

# debugging
# 100.times do
#   d = Deck.new
#   p = Player.new('Victor')
#   3.times { p.add_a_card(d.give_a_card) }
#   next unless p.includes_ace?
#   puts p.current_cards.inspect
#   puts p.current_value
#   puts '----------'
# end
