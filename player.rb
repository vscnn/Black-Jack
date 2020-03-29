require_relative 'deposit'
require_relative 'game'

class Player
  include Deposit

  attr_accessor :current_cards

  def initialize(name = '')
    @name = name
    @current_cards = []
    super()
  end

  def current_value
    sum = @current_cards.sum { |c| c[:value] }
    if (@current_cards.length > 2 && ((@current_cards[0][:value] + @current_cards[1][:value]) > 10) && @current_cards.last[:name].include?('A')) || (@current_cards[0][:name].include?('A') && @current_cards[1][:name].include?('A'))
      sum -= 10
    end
    sum
  end

  def next_turn
    Game.get_cards(self, 1)
  end
end

p = Player.new
d = Player.new
Game.start(p, d)
puts "Игрок: #{p.current_value}"
puts "Дилер: #{d.current_value}"
Game.calc
puts "Банк игрока: #{p.deposit}$"
puts "Банк дилера: #{d.deposit}$"
puts '--------'
