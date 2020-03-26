module Deposit
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    # ...
  end

  module InstanceMethods
    attr_reader :deposit

    def initialize
      @deposit = 1000
    end

    def set_bet
      @deposit -= 10
    end

    def won_bet
      @deposit += 20
    end
  end
end
