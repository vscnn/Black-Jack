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
end

p = Player.new('Victor')
d = Player.new('Dealer')
loop do
  puts 'Играть будете? (y/n)'
  ans = gets.chomp
  break if ans != 'y'
  if ans == 'y'
    Game.start(p, d)
    puts "#{p.name}: #{p.current_value}"
    puts "#{d.name}: #{d.current_value}"
    puts "Банк игрока: #{p.deposit}$"
    puts "Банк дилера: #{d.deposit}$"
    puts '--------'
    puts "1) Добавить еще карту\n2) Открыть карты"
    a = gets.chomp
    if a.to_i == 1
      p.add_card
      puts "#{p.name}: #{p.current_value}"
      puts "#{d.name}: #{d.current_value}"
      puts '--------'
      Game.calc
      puts "Банк игрока: #{p.deposit}$"
      puts "Банк дилера: #{d.deposit}$"
    elsif a.to_i == 2
      puts "#{p.name}: #{p.current_value}"
      puts "#{d.name}: #{d.current_value}"
      puts '--------'
      Game.calc
      puts "Банк игрока: #{p.deposit}$"
      puts "Банк дилера: #{d.deposit}$"
    end
  else
    puts 'Ок, прощайте!'
  end
end
