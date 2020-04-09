class Player
  attr_reader :name, :deposit
  attr_accessor :hand

  def initialize(name)
    @name = name
    @deposit = 100
    super()
  end

  def set_bet
    @deposit -= 10
  end

  def won_bet
    @deposit += 20
  end

  def draw
    @deposit += 10
  end

end
