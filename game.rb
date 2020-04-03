require_relative 'cards'

class Game
  def initialize(player, dealer)
    Cards.generate
    @player = player
    @dealer = dealer
    @player.update_cards
    @dealer.update_cards
    self.class.get_cards(player)
    @player.send(:set_bet)
    self.class.get_cards(dealer)
    @dealer.send(:set_bet)
  end

  def self.get_cards(player, count = 2)
    cards = player.instance_variable_get(:@current_cards)
    count.times { cards << Cards.random }
    count.times { player.instance_variable_set(:@current_cards, cards) }
  end

  def calc
    player_value = @player.current_value
    dealer_value = @dealer.current_value
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

