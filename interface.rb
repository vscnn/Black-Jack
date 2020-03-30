require_relative 'player'
require_relative 'game'
require_relative 'dealer'
require_relative 'deposit'

def repl
  puts 'Добро пожаловать в блекджек...'
  puts 'Ваше имя: '
  playername = gets.chomp
  p = Player.new(playername)
  d = Dealer.new('Dealer')
  puts "Здравствуйте, #{playername}"
  puts "Ваш банк: #{p.deposit}$"

  loop do
    if d.deposit.zero?
      puts 'Вы обобрали несчастного дилера до нитки!'
      break
    elsif p.deposit.zero?
      puts 'Вы всё проиграли, идите домой!'
      break
    end
    puts 'Играть будете? (y/n)'
    ans = gets.chomp
    break if ans != 'y'
    if ans == 'y'
      Game.start(p, d)
      puts "#{p.name}: #{p.current_value}"
      puts "#{d.name}: #{('*' * d.current_cards.length)}"
      puts "Банк игрока: #{p.deposit}$"
      puts "Банк дилера: #{d.deposit}$"
      puts '--------'
      puts "1) Добавить еще карту\n2) Открыть карты\n3) Пропустить ход"
      a = gets.chomp
      if a.to_i == 1
        p.add_card
        d.turn
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
      elsif a.to_i == 3
        # После пропуска и решения дилера должна быть возможность еще одного хода игрока
        d.turn
        puts "#{p.name}: #{p.current_value}"
        puts "#{d.name}: #{d.current_value}, Карт: #{d.current_cards.length}"
        puts '--------'
        Game.calc
        puts "Банк игрока: #{p.deposit}$"
        puts "Банк дилера: #{d.deposit}$"
      end
      if p.current_cards.length == 3
        puts "#{p.name}: #{p.current_value}"
        puts "#{d.name}: #{d.current_value}, Карт: #{d.current_cards.length}"
        puts '--------'
        Game.calc
        puts "Банк игрока: #{p.deposit}$"
        puts "Банк дилера: #{d.deposit}$"
        puts '----'
      end
    else
      puts 'Ок, прощайте!'
    end
  end
end

repl
