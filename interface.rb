require_relative 'player'
require_relative 'game'
require_relative 'dealer'

class Interface

  def print_current_values(*args)
    args.each { |player| puts "#{player.name}: #{show_current_cards(player)} == #{player.hand.current_value}" }
  end

  def print_current_deposits(*args)
    args.each { |player| puts "#{player.name}'s deposit: #{player.deposit}$" }
  end

  def show_current_cards(player)
    player.hand.current_cards.collect(&:name).join(' ')
  end

  def hide_current_cards(player)
    '* ' * player.hand.current_cards.length
  end

  def print_winner(winner, player, dealer)
    case winner
    when 0
        puts "Победитель: #{player.name}"
    when 1
        puts "Победитель: #{dealer.name}"
    when 2
        puts 'Ничья'
    end
  end

  def endgame?(player, dealer)
    if dealer.deposit.zero?
      puts 'Вы обобрали несчастного дилера до нитки!'
    elsif player.deposit.zero?
      puts 'Вы всё проиграли, идите домой!'
    end
  end

  def repl
    puts 'Добро пожаловать в блекджек...'
    puts 'Ваше имя: '

    name = gets.chomp
    p = Player.new(name)
    d = Dealer.new('Dealer')

    puts "Здравствуйте, #{name}"
    puts "Ваш банк: #{p.deposit}$"

    loop do
      # Вынести всё в подметоды
      break if endgame?(p, d)
      puts 'Играть будете? (y/n)'
      ans = gets.chomp
      break if ans != 'y'
      next unless ans == 'y'
      g = Game.new(p, d)
      g.start
      puts "Ваши карты: #{show_current_cards(p)}"
      puts "Карты дилера: #{hide_current_cards(d)}"
      puts '--------'
      puts "1) Добавить еще карту\n2) Открыть карты\n3) Пропустить ход"
      a = gets.chomp
      if a.to_i == 1
        g.add_a_card(p)
        case d.turn(g.deck)
        when 0
            puts 'Диллер пропустил ход'
        end
        print_current_values(p, d)
        puts '--------'
        winner = g.calc
        print_winner(winner, p, d)
        print_current_deposits(p, d)
      elsif a.to_i == 2
        d.turn(g.deck)
        print_current_values(p, d)
        puts '--------'
        winner = g.calc
        print_winner(winner, p, d)
        print_current_deposits(p, d)
      elsif a.to_i == 3
        d.turn(g.deck)
        puts "Ваши карты: #{show_current_cards(p)}"
        puts "Карты дилера: #{hide_current_cards(d)}"
        puts '--------'
        puts "1) Добавить еще карту\n2) Открыть карты"
        b = gets.chomp
        if b.to_i == 1
          g.add_a_card(p)
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

i = Interface.new
i.repl
