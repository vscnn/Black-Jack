require_relative 'deposit'
require_relative 'cards'

class Test
  include Deposit
  include Cards

  attr_reader :current_cards

  def initialize(name)
    @name = name
    @current_cards = []
    super()
  end

  def get_cards
    2.times { @current_cards.push(random_card) }
  end

  def current_value
    @current_cards.sum { |c| c[:value] }
  end
end

t = Test.new('Victor')
t.get_cards
puts t.current_cards.inspect
puts t.current_value