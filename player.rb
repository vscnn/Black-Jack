require_relative 'deposit'
require_relative 'game'

class Player
  include Deposit

  attr_accessor :current_cards
  attr_reader :name

  def initialize(name)
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

  def add_card
    Game.get_cards(self, 1)
  end

  def update_cards
    @current_cards = []
  end

  def show_current_cards
    current_cards.collect { |card| card[:name] }.join(' ')
  end

  def hide_current_cards
    '* ' * current_cards.length
  end
end

