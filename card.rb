class Card
  attr_reader :name, :value
  attr_accessor :in_use

  def initialize(name, value, in_use)
    @name = name
    @value = value
    @in_use = in_use
  end
end
