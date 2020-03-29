require_relative 'deposit'

class Game
  include Deposit

  @@cards = [{ name: '2♣', value: 2, in_use: false },
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

  attr_accessor :cards

  def self.random_card
    choosed_card = @@cards.select { |card| card[:in_use] == false }.sample
    @@cards.select { |card| card.object_id == choosed_card.object_id }.first[:in_use] = true
    choosed_card
  end

  def self.refresh_cards
    @@cards.select { |card| card[:in_use] == true }.each { |card| card[:in_use] = false }
  end

  def self.get_cards(player, count = 2)
    cards = player.instance_variable_get(:@current_cards)
    count.times { cards << random_card }
    count.times { player.instance_variable_set(:@current_cards, cards) }
  end

  def self.calc
    player_value = @player.current_value
    dealer_value = @dealer.current_value

    if player_value == dealer_value
      @dealer.send(:draw)
      @player.send(:draw)
      puts 'Ничья'
    elsif ((21 - player_value) < (21 - dealer_value) && player_value <= 21) || dealer_value > 21
      @player.send(:won_bet)
      puts 'Выиграил игрок'
    elsif ((21 - dealer_value) < (21 - player_value) && dealer_value <= 21) || player_value > 21
      @dealer.send(:won_bet)
      puts 'Выиграл дилер'
    end
  end

  def self.start(player, dealer)
    refresh_cards
    @player = player
    @dealer = dealer
    @player.update_cards
    @dealer.update_cards
    get_cards(player)
    @player.send(:set_bet)
    get_cards(dealer)
    @dealer.send(:set_bet)
  end

end

