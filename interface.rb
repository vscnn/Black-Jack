require_relative 'player'
require_relative 'game'
require_relative 'dealer'

class Interface
  def self.repl
    puts 'Добро пожаловать в блекджек...'
    puts 'Ваше имя: '
    playername = gets.chomp
    p = Player.new(playername)
    d = Dealer.new('Dealer')
    puts "Здравствуйте, #{playername}"
    puts "Ваш банк: #{p.deposit}$"

    def self.print_current_values(*args)
      args.each { |player| puts "#{player.name}: #{player.show_current_cards} == #{player.current_value}" }
    end

    def self.print_current_deposits(*args)
      args.each { |player| puts "#{player.name}'s deposit: #{player.deposit}$" }
    end

    def self.print_winner(winner, player, dealer)
      case winner
        when 0
          puts "Победитель: #{player.name}"
        when 1
          puts "Победитель: #{dealer.name}"
        when 2
          puts 'Ничья'
      end
    end


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
        g = Game.new(p, d)
        puts "Ваши карты: #{p.show_current_cards}"
        puts "Карты дилера: #{d.hide_current_cards}"
        puts '--------'
        puts "1) Добавить еще карту\n2) Открыть карты\n3) Пропустить ход"
        a = gets.chomp
        if a.to_i == 1
          p.add_card
          case d.turn
            when 0
              puts 'Диллер пропустил ход'
          end
          print_current_values(p, d)
          puts '--------'
          winner = g.calc
          print_winner(winner, p, d)
          print_current_deposits(p, d)
        elsif a.to_i == 2
          print_current_values(p, d)
          puts '--------'
          winner = g.calc
          print_winner(winner, p, d)
          print_current_deposits(p, d)
        elsif a.to_i == 3
          d.turn
          puts "Ваши карты: #{p.show_current_cards}"
          puts "Карты дилера: #{d.hide_current_cards}"
          puts '--------'
          puts "1) Добавить еще карту\n2) Открыть карты"
          b = gets.chomp
          if b.to_i == 1
            p.add_card
            print_current_values(p, d)
            puts '--------'
            winner = g.calc
            print_winner(winner, p, d)
            print_current_deposits(p, d)
          elsif b.to_i == 2
            print_current_values(p, d)
            puts '--------'
            winner = g.calc
            print_winner(winner, p, d)
            print_current_deposits(p, d)
          end
        end
      end
    end
  end
end
