class Hand
  attr_accessor :current_cards

  def initialize
    @current_cards = []
    super
  end

  def includes_ace?
    @current_cards.any?(&:ace?)
  end

  def both_aces?
    @current_cards.length == 2 && @current_cards[0].ace? && @current_cards[1].ace?
  end

  def current_value
    sum = @current_cards.sum(&:value)
    if @current_cards.length > 2 && ((@current_cards[0].value + @current_cards[1].value) > 10) && @current_cards.last.ace?
      sum -= 10
    elsif both_aces?
      sum = 12
    end
    sum
  end

  def add_a_card(card)
    @current_cards << card
  end
end
