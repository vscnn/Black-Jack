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

  def print_current_card(player, dealer)
    puts "Ваши карты: #{show_current_cards(player)}"
    puts "Карты дилера: #{hide_current_cards(dealer)}"
  end

  def print_winner(player, dealer)
    winner = @game.calc
    case winner
    when 0
      puts "Победитель: #{player.name}"
    when 1
      puts "Победитель: #{dealer.name}"
    when 2
      puts 'Ничья'
    end
  end

  def start
    puts 'Добро пожаловать в блекджек...'
    puts 'Ваше имя: '
    name = gets.chomp
    @player = Player.new(name)
    @dealer = Dealer.new('Dealer')
    puts "Здравствуйте, #{name}"
    puts "Ваш банк: #{@player.deposit}$"
  end

  def round
    @game = Game.new(@player, @dealer)
    @game.start
    print_current_card(@player, @dealer)
    puts '--------'
    puts "1) Добавить еще карту\n2) Открыть карты\n3) Пропустить ход"
    a = gets.chomp
  end

  def endgame?
    if @dealer.deposit.zero?
      puts 'Вы обобрали несчастного дилера до нитки!'
      true
    elsif @player.deposit.zero?
      puts 'Вы всё проиграли, идите домой!'
      true
    end
  end

  def print_hr
    puts '--------'
  end

  def print_results
    print_current_values(@player, @dealer)
    print_hr
    print_winner(@player, @dealer)
    print_current_deposits(@player, @dealer)
  end

  def repl
    start
    loop do
      break if endgame?
      puts 'Играть будете? (y/n)'
      ans = gets.chomp
      break if ans != 'y'
      a = round
      if a.to_i == 1
        @game.add_a_card(@player)
        case @dealer.turn(@game.deck)
        when 0
          puts 'Диллер пропустил ход'
        end
        print_results
      elsif a.to_i == 2
        @dealer.turn(@game.deck)
        print_results
      elsif a.to_i == 3
        @dealer.turn(@game.deck)
        print_current_card(@player, @dealer)
        print_hr
        puts "1) Добавить еще карту\n2) Открыть карты"
        b = gets.chomp
        if b.to_i == 1
          @game.add_a_card(@player)
          print_results
        elsif b.to_i == 2
          print_results
        end
      end
    end
  end
end
