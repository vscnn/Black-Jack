require_relative 'player'

def repl
  puts 'Добро пожаловать в блекджек...'
  print 'Ваше имя: '
  playername = gets.chomp
  player = Player.new(playername)
  puts "Здравствуйте, #{playername}"
  puts "Ваш банк: #{player.deposit}$"
  player.start
end

repl
