require_relative 'deposit'
require_relative 'cards'

class Game
  include Deposit
  include Cards

  attr_reader :current_cards

  def initialize()
    @current_cards = []
    super()
    start
  end

  def get_cards(count = 2)
    count.times { @current_cards.push(random_card) }
  end

  def current_value
    sum = @current_cards.sum { |c| c[:value] }
    if @current_cards.length > 2 && ((@current_cards[0][:value] + @current_cards[1][:value]) > 10) && @current_cards.last[:name].include?('A')
      sum -= 10
      puts 'sum -10'
    end
    sum
  end

  def start
    get_cards
    puts "Ваши карты: #{@current_cards}. Сумма: #{current_value}"
    if current_value < 21
      puts "Ещё? (y/n)"
      answer = gets.chomp
      if answer == 'y'
        next_turn
      end
    elsif current_value == 21
      puts 'Блекджек!'
    end
  end

  def next_turn
    get_cards(1)
    if current_value == 21
      puts "Ваши карты: #{@current_cards}. Сумма: #{current_value}"
      puts "Блекджек!"
    elsif current_value < 21
      puts "Ваши карты: #{@current_cards}. Сумма: #{current_value}"
      puts "Добирать больше нельзя"
    elsif current_value > 21
      puts "Ваши карты: #{@current_cards}. Сумма: #{current_value}"
      puts "Перебор!"
    end
  end
end

Game.new
