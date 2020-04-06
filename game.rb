require_relative 'deck'
require_relative 'hand'

class Game
  def initialize(player, dealer)
    Deck.generate
    @player = player
    @dealer = dealer
    @player_hand = Hand.new(@player)
    @dealer_hand = Hand.new(@dealer)
    puts 'updated'
    @player.send(:set_bet)
    @dealer.send(:set_bet)
  end

  def calc
    # TOFIX: https://take.ms/nkbju
    player_value = @player_hand.current_value
    dealer_value = @dealer_hand.current_value
    # 0 player win; 1 dealer win; 2 draw
    if player_value == dealer_value
      @dealer.send(:draw)
      @player.send(:draw)
      2
    elsif ((21 - player_value) < (21 - dealer_value) && player_value <= 21) || dealer_value > 21
      @player.send(:won_bet)
      0
    elsif ((21 - dealer_value) < (21 - player_value) && dealer_value <= 21) || player_value > 21
      @dealer.send(:won_bet)
      1
    end
  end
end

