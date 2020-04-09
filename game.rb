require_relative 'deck'
require_relative 'hand'

class Game
  attr_reader :deck

  def initialize(player, dealer)
    @deck = Deck.new
    @player = player
    @dealer = dealer
    @player.hand = Hand.new
    @dealer.hand = Hand.new
    @player.set_bet
    @dealer.set_bet
  end

  def start
    2.times do
      @player.hand.add_a_card(@deck.give_a_card)
      @dealer.hand.add_a_card(@deck.give_a_card)
    end
  end

  def add_a_card(player)
    player.hand.add_a_card(@deck.give_a_card)
  end

  def calc
    player_value = @player.hand.current_value
    dealer_value = @dealer.hand.current_value
    # 0 player win; 1 dealer win; 2 draw
    if player_value == dealer_value
      @dealer.draw
      @player.draw
      2
    elsif ((21 - player_value) < (21 - dealer_value) && player_value <= 21) || dealer_value > 21
      @player.won_bet
      0
    elsif ((21 - dealer_value) < (21 - player_value) && dealer_value <= 21) || player_value > 21
      @dealer.won_bet
      1
    end
  end
end

